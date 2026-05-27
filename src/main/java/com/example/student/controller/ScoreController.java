package com.example.student.controller;

import com.example.student.dto.ScoreDTO;
import com.example.student.dto.GradeSummaryDTO;
import com.example.student.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 성적 관련 API 요청을 처리하는 컨트롤러
 */
@RestController
@RequestMapping("/scores")
public class ScoreController {

    @Autowired
    private ScoreService scoreService;

    /**
     * 전체 성적 목록 조회 API
     * GET /scores
     */
    @GetMapping
    public List<ScoreDTO> list() {
        return scoreService.getAllScores();
    }

    /**
     * 특정 학생의 성적 목록 조회 API
     * GET /scores/student/{studentId}
     */
    @GetMapping("/student/{studentId}")
    public List<ScoreDTO> listByStudent(@PathVariable Long studentId) {
        return scoreService.getScoresByStudentId(studentId);
    }

    /**
     * 특정 학생의 평균 및 최종 등급 조회 API
     * GET /scores/average/{studentId}
     */
    @GetMapping("/average/{studentId}")
    public GradeSummaryDTO getAverage(@PathVariable Long studentId) {
        return scoreService.getAverageAndGrade(studentId);
    }

    /**
     * 모든 학생의 성적 요약(평균/등급) 목록 조회 API
     * GET /scores/averages
     */
    @GetMapping("/averages")
    public List<GradeSummaryDTO> listAverages() {
        return scoreService.getAllGradeSummaries();
    }

    /**
     * 성적 등록 API
     * POST /scores
     */
    @PostMapping
    public String create(@RequestBody ScoreDTO score) {
        scoreService.addScore(score);
        return "SUCCESS";
    }

    /**
     * 성적 수정 API
     * PUT /scores/{id}
     */
    @PutMapping("/{id}")
    public String update(@PathVariable Long id, @RequestBody ScoreDTO score) {
        scoreService.updateScore(id, score);
        return "SUCCESS";
    }

    /**
     * 성적 삭제 API
     * DELETE /scores/{id}
     */
    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id) {
        scoreService.deleteScore(id);
        return "SUCCESS";
    }
}
