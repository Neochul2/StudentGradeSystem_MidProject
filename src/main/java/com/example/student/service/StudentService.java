package com.example.student.service;

import com.example.student.dto.StudentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 학생 관련 비즈니스 로직 및 DB 접근을 담당하는 서비스 클래스 (DAO 없이 JdbcTemplate 직접 사용)
 */
@Service
@Transactional
public class StudentService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 모든 학생 목록 조회
     */
    public List<StudentDTO> getAllStudents() {
        String sql = "SELECT id, name, phone_number as phoneNumber, department FROM students ORDER BY id DESC";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(StudentDTO.class));
    }

    /**
     * 특정 학생 조회
     */
    public StudentDTO getStudentById(Long id) {
        String sql = "SELECT id, name, phone_number as phoneNumber, department FROM students WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(StudentDTO.class), id);
    }

    /**
     * 학생 등록
     */
    public int addStudent(StudentDTO student) {
        String sql = "INSERT INTO students (name, phone_number, department) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, student.getName(), student.getPhoneNumber(), student.getDepartment());
    }

    /**
     * 학생 정보 수정
     */
    public int updateStudent(Long id, StudentDTO student) {
        String sql = "UPDATE students SET name = ?, phone_number = ?, department = ? WHERE id = ?";
        return jdbcTemplate.update(sql, student.getName(), student.getPhoneNumber(), student.getDepartment(), id);
    }

    /**
     * 학생 삭제
     */
    public int deleteStudent(Long id) {
        String sql = "DELETE FROM students WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}
