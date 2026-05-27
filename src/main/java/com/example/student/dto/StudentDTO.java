package com.example.student.dto;

/**
 * 학생 정보를 담는 Data Transfer Object (DTO)
 */
public class StudentDTO {
    private Long id;
    private String name;
    private String phoneNumber;
    private String department;

    // 기본 생성자
    public StudentDTO() {}

    // 모든 필드를 포함하는 생성자
    public StudentDTO(Long id, String name, String phoneNumber, String department) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.department = department;
    }

    // Getter 및 Setter 메서드
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "StudentDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", department='" + department + '\'' +
                '}';
    }
}
