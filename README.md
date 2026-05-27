# Student Grade Management System

Spring Legacy 기반의 학생 성적 관리 시스템 프로젝트입니다.
학생 정보 및 성적 데이터를 관리할 수 있으며 Docker와 PostgreSQL을 연동하여 컨테이너 환경으로 구성하였습니다.

---

## 프로젝트 소개

* 학생 정보 등록 및 조회
* 학생 정보 수정 및 삭제
* 성적 등록 및 조회
* 학생 평균 점수 계산
* 최종 등급 자동 계산
* REST API 기반 CRUD 기능 제공
* Docker Compose 기반 통합 실행 환경 구성

---

## 개발 환경

* OS : Windows 11
* IDE : VS Code
* Java : 11
* Maven : 3.x
* Git / GitHub

---

## 실행 및 배포 환경

* Ubuntu 24.04 LTS (VirtualBox)
* Docker 29.4.0
* Docker Compose v5.1.3
* PostgreSQL 15
* Tomcat 9

---

## 기술 스택

* Spring Framework 5.3.31 (Spring MVC)
* JSP 2.3
* JdbcTemplate
* PostgreSQL
* Docker / Docker Compose
* REST API

---

## 주요 기능

### 학생 관리

* 학생 등록
* 학생 목록 조회
* 학생 정보 수정
* 학생 삭제

### 성적 관리

* 성적 등록
* 성적 조회
* 평균 점수 계산
* 최종 등급 자동 계산

---

## 프로젝트 구조

* Controller : 요청 처리 및 REST API 구성
* Service : 비즈니스 로직 처리
* DTO : 데이터 전달 객체
* JSP : 사용자 화면(View)
* PostgreSQL : 데이터 저장

---

## Docker 실행 방법

```bash id="n5z7ke"
mvn clean package
docker compose up --build -d
```

---

## 컨테이너 상태 확인

```bash id="s2m4vt"
docker ps
```

---

## 컨테이너 종료

```bash id="g9r1pw"
docker compose down
```

---

## 실행 주소

```text id="a8w2cz"
http://localhost:8282
```

---

## 프로젝트 특징

* Spring Legacy MVC 패턴 기반 설계
* JdbcTemplate 기반 PostgreSQL 연동
* JSP + JavaScript 기반 화면 구성
* REST API 기반 CRUD 기능 구현
* Docker Compose를 활용한 웹 서버 및 DB 통합 관리
* PostgreSQL 컨테이너 기반 데이터 영속성 구성

---

