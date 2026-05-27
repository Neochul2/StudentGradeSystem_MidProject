package com.example.student.controller;

import com.example.student.dto.StudentDTO;
import com.example.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.util.List;

/**
 * 메인 페이지 및 학생 관련 API 요청을 처리하는 컨트롤러
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * [메인] 루트 경로 접속 시 index.jsp 반환
     */
    @GetMapping("/")
    public String home() {
        return "index";
    }

    /**
     * [페이지] 학생 목록 조회 창 이동
     */
    @GetMapping("/students/view")
    public String listView() {
        return "student-list";
    }

    /**
     * [API] 학생 목록 조회
     */
    @GetMapping("/students")
    @ResponseBody
    public List<StudentDTO> list() {
        return studentService.getAllStudents();
    }

    /**
     * [API] 학생 등록
     */
    @PostMapping("/students")
    @ResponseBody
    public ResponseEntity<String> create(@RequestBody StudentDTO student) {
        try {
            if (student.getName() == null || student.getPhoneNumber() == null) {
                return ResponseEntity.badRequest().body("이름과 전화번호는 필수 항목입니다.");
            }
            studentService.addStudent(student);
            return ResponseEntity.ok("SUCCESS");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("등록 실패: " + e.getMessage());
        }
    }

    /**
     * [API] 학생 수정
     */
    @PutMapping("/students/{id}")
    @ResponseBody
    public String update(@PathVariable Long id, @RequestBody StudentDTO student) {
        studentService.updateStudent(id, student);
        return "SUCCESS";
    }

    /**
     * [API] 학생 삭제
     */
    @DeleteMapping("/students/{id}")
    @ResponseBody
    public String delete(@PathVariable Long id) {
        studentService.deleteStudent(id);
        return "SUCCESS";
    }
}
