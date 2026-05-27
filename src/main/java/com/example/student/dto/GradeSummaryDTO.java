package com.example.student.dto;

/**
 * 학생별 평균 점수와 최종 등급 정보를 담는 DTO
 */
public class GradeSummaryDTO {
    private String studentName;
    private double averageScore;
    private String finalGrade;

    public GradeSummaryDTO() {}

    public GradeSummaryDTO(String studentName, double averageScore, String finalGrade) {
        this.studentName = studentName;
        this.averageScore = averageScore;
        this.finalGrade = finalGrade;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public double getAverageScore() {
        return averageScore;
    }

    public void setAverageScore(double averageScore) {
        this.averageScore = averageScore;
    }

    public String getFinalGrade() {
        return finalGrade;
    }

    public void setFinalGrade(String finalGrade) {
        this.finalGrade = finalGrade;
    }
}
