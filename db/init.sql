-- [1] 학생 테이블 생성
CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- [2] 성적 테이블 생성 (학생 삭제 시 관련 성적도 자동 삭제되도록 ON DELETE CASCADE 설정)
CREATE TABLE IF NOT EXISTS scores (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    subject VARCHAR(100) NOT NULL,
    score INTEGER CHECK (score >= 0 AND score <= 100),
    grade VARCHAR(2),
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- [3] 초기 학생 데이터 추가
INSERT INTO students (name, phone_number, department) VALUES 
('홍길동', '01012345678', '스마트금융과（핀테크）'),
('이영희', '01098859999', '사이버보안과'),
('김철수', '01012229999', '출판편집디자인과')
ON CONFLICT (phone_number) DO NOTHING;

-- [4] 초기 성적 데이터 추가 (서브쿼리를 사용하여 실제 생성된 ID를 동적으로 할당)
-- 홍길동의 성적
INSERT INTO scores (student_id, subject, score, grade) 
SELECT id, '품질보증기초', 95, 'A' FROM students WHERE phone_number = '01012345678'
ON CONFLICT DO NOTHING;

INSERT INTO scores (student_id, subject, score, grade) 
SELECT id, '데이터베이스', 88, 'B' FROM students WHERE phone_number = '01012345678'
ON CONFLICT DO NOTHING;

-- 이영희의 성적
INSERT INTO scores (student_id, subject, score, grade) 
SELECT id, '편집디자인론', 92, 'A' FROM students WHERE phone_number = '01098859999'
ON CONFLICT DO NOTHING;
