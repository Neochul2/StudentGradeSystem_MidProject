package com.example.student.dto;

/**
 * 성적 정보를 담는 Data Transfer Object (DTO)
 */
public class ScoreDTO {
    private Long id;
    private Long studentId;
    private String studentName; // 학생명 추가 (JOIN 결과 저장용)
    private String subject;
    private int score;
    private String grade;

    // 기본 생성자
    public ScoreDTO() {}

    // 모든 필드를 포함하는 생성자
    public ScoreDTO(Long id, Long studentId, String studentName, String subject, int score, String grade) {
        this.id = id;
        this.studentId = studentId;
        this.studentName = studentName;
        this.subject = subject;
        this.score = score;
        this.grade = grade;
    }

    // Getter 및 Setter 메서드
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "ScoreDTO{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", studentName='" + studentName + '\'' +
                ", subject='" + subject + '\'' +
                ", score=" + score +
                ", grade='" + grade + '\'' +
                '}';
    }
}
