package com.example.student.service;

import com.example.student.dto.ScoreDTO;
import com.example.student.dto.GradeSummaryDTO;
import com.example.student.dto.StudentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 성적 관련 비즈니스 로직 및 DB 접근을 담당하는 서비스 클래스 (DAO 없이 JdbcTemplate 직접 사용)
 */
@Service
@Transactional
public class ScoreService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    private StudentService studentService;

    /**
     * 모든 성적 목록 조회 (학생명 포함)
     */
    public List<ScoreDTO> getAllScores() {
        String sql = "SELECT s.*, st.name as student_name FROM scores s " +
                     "JOIN students st ON s.student_id = st.id " +
                     "ORDER BY s.id DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ScoreDTO.class));
    }

    /**
     * 특정 학생의 성적 목록 조회
     */
    public List<ScoreDTO> getScoresByStudentId(Long studentId) {
        String sql = "SELECT s.*, st.name as student_name FROM scores s " +
                     "JOIN students st ON s.student_id = st.id " +
                     "WHERE s.student_id = ? " +
                     "ORDER BY s.id DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ScoreDTO.class), studentId);
    }

    /**
     * 특정 성적 정보 조회
     */
    public ScoreDTO getScoreById(Long id) {
        String sql = "SELECT s.*, st.name as student_name FROM scores s " +
                     "JOIN students st ON s.student_id = st.id " +
                     "WHERE s.id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(ScoreDTO.class), id);
    }

    /**
     * 성적 등록
     */
    public int addScore(ScoreDTO score) {
        score.setGrade(calculateGrade(score.getScore()));
        String sql = "INSERT INTO scores (student_id, subject, score, grade) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, score.getStudentId(), score.getSubject(), score.getScore(), score.getGrade());
    }

    /**
     * 성적 수정
     */
    public int updateScore(Long id, ScoreDTO score) {
        score.setGrade(calculateGrade(score.getScore()));
        String sql = "UPDATE scores SET subject = ?, score = ?, grade = ? WHERE id = ?";
        return jdbcTemplate.update(sql, score.getSubject(), score.getScore(), score.getGrade(), id);
    }

    /**
     * 성적 삭제
     */
    public int deleteScore(Long id) {
        String sql = "DELETE FROM scores WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    /**
     * 특정 학생의 평균 점수와 등급 계산
     */
    public GradeSummaryDTO getAverageAndGrade(Long studentId) {
        StudentDTO student = studentService.getStudentById(studentId);
        List<ScoreDTO> scores = getScoresByStudentId(studentId);
        
        double average = calculateAverage(scores);
        String finalGrade = calculateGrade((int) Math.round(average));
        
        return new GradeSummaryDTO(student.getName(), average, finalGrade);
    }
    
    /**
     * 모든 학생의 성적 요약(평균/등급) 목록 조회
     */
    public List<GradeSummaryDTO> getAllGradeSummaries() {
        List<StudentDTO> students = studentService.getAllStudents();
        List<GradeSummaryDTO> summaries = new ArrayList<>();
        
        for (StudentDTO student : students) {
            List<ScoreDTO> scores = getScoresByStudentId(student.getId());
            if (!scores.isEmpty()) {
                double average = calculateAverage(scores);
                String finalGrade = calculateGrade((int) Math.round(average));
                summaries.add(new GradeSummaryDTO(student.getName(), average, finalGrade));
            }
        }
        return summaries;
    }

    public double calculateAverage(List<ScoreDTO> scores) {
        if (scores == null || scores.isEmpty()) {
            return 0.0;
        }
        int sum = 0;
        for (ScoreDTO score : scores) {
            sum += score.getScore();
        }
        return (double) sum / scores.size();
    }

    public String calculateGrade(int score) {
        if (score >= 90) return "A";
        else if (score >= 80) return "B";
        else if (score >= 70) return "C";
        else if (score >= 60) return "D";
        else return "F";
    }
}
