<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kopo 학생 성적 관리 시스템</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 20px;
	background-color: #f8f9fa;
}

.container {
	max-width: 900px;
	margin: auto;
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
	text-align: center;
	border-bottom: 2px solid #007bff;
	padding-bottom: 10px;
}

h2 {
	color: #007bff;
	margin-top: 30px;
	border-left: 5px solid #007bff;
	padding-left: 10px;
}

section {
	margin-bottom: 40px;
}

form {
	margin-bottom: 20px;
	border: 1px solid #dee2e6;
	padding: 20px;
	border-radius: 8px;
	background-color: #fff;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input, select {
	padding: 10px;
	width: 100%;
	box-sizing: border-box;
	border: 1px solid #ced4da;
	border-radius: 4px;
}

button {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

button:hover {
	background-color: #0056b3;
}

.btn-register {
	background-color: #28a745;
}

.btn-register:hover {
	background-color: #218838;
}

.btn-update {
	background-color: #ffc107;
	color: #212529;
	padding: 5px 10px;
	font-size: 0.8em;
}

.btn-update:hover {
	background-color: #e0a800;
}

.btn-delete {
	background-color: #dc3545;
	padding: 5px 10px;
	font-size: 0.8em;
}

.btn-delete:hover {
	background-color: #c82333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
	background-color: white;
}

th, td {
	border: 1px solid #dee2e6;
	padding: 12px;
	text-align: center;
}

th {
	background-color: #f1f3f5;
	color: #495057;
}

tr:hover {
	background-color: #f8f9fa;
}

.empty-msg {
	text-align: center;
	color: #6c757d;
	padding: 20px;
}

/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: white;
	margin: 10% auto;
	padding: 20px;
	border-radius: 10px;
	width: 400px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.modal-header {
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 15px;
}

.modal-footer {
	border-top: 1px solid #ddd;
	padding-top: 10px;
	margin-top: 15px;
	text-align: right;
}

.btn-secondary {
	background-color: #6c757d;
}

.btn-secondary:hover {
	background-color: #5a6268;
}
</style>
</head>
<body>
	<div class="container">
		<h1>하이테크 학생 성적 관리 시스템</h1>

		<!-- [1] 학생 등록 영역 -->
		<section>
			<h2>[1] 학생 등록</h2>
			<form id="studentForm">
				<div class="form-group">
					<input type="text" id="name" placeholder="학생 이름" required>
				</div>
				<div class="form-group">
					<input type="text" id="phoneNumber"
						placeholder="전화번호 (예: 01012345678)" required>
				</div>
				<div class="form-group">
					<label for="department">학과 선택</label> <select id="department"
						required>
						<option value="사이버보안과">사이버보안과</option>
						<option value="스마트금융과">스마트금융과</option>
						<option value="출판편집디자인과">출판편집디자인과</option>
					</select>
				</div>
				<button type="submit" class="btn-register">학생 등록</button>
			</form>
		</section>

		<!-- [2] 학생 목록 영역 -->
		<section>
			<div style="display: flex; justify-content: space-between; align-items: center;">
				<h2>[2] 학생 목록</h2>
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/students/view'" style="background-color: #17a2b8;">학생 조회창 열기</button>
			</div>
			<table id="studentTable">
				<thead>
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>학과</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 동적 추가 -->
				</tbody>
			</table>
		</section>

		<!-- [3] 성적 등록 영역 -->
		<section>
			<h2>[3] 성적 등록</h2>
			<form id="scoreForm">
				<div class="form-group">
					<label for="studentSelect">학생 선택</label> <select id="studentSelect"
						required>
						<option value="">-- 학생을 선택하세요 --</option>
					</select>
				</div>
				<div class="form-group">
					<label for="subject">과목명</label> <input type="text" id="subject"
						placeholder="과목 입력 (예: 국어, 수학, 보안개론)" required>
				</div>
				<div class="form-group">
					<label for="score">점수 (0~100)</label> <input type="number"
						id="score" min="0" max="100" placeholder="점수 입력" required>
				</div>
				<button type="submit">성적 등록</button>
			</form>
		</section>

		<!-- [4] 성적 목록 영역 -->
		<section>
			<h2>[4] 성적 목록 (전체)</h2>
			<table id="scoreTable">
				<thead>
					<tr>
						<th>학생명</th>
						<th>과목</th>
						<th>점수</th>
						<th>등급</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 동적 추가 -->
				</tbody>
			</table>
		</section>

		<!-- [5] 평균 결과 영역 -->
		<section>
			<h2>[5] 평균 및 최종 등급</h2>
			<table id="averageTable">
				<thead>
					<tr>
						<th>학생명</th>
						<th>평균 점수</th>
						<th>최종 등급</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 동적 추가 -->
				</tbody>
			</table>
		</section>
	</div>


	<!-- 학생 수정 모달 -->
	<div id="updateModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h3>학생 정보 수정</h3>
			</div>

			<form id="updateForm">
				<input type="hidden" id="updateId">

				<div class="form-group">
					<label>이름</label> <input type="text" id="updateName" required>
				</div>

				<div class="form-group">
					<label>전화번호</label> <input type="text" id="updatePhoneNumber"
						required>
				</div>

				<div class="form-group">
					<label>학과</label> <select id="updateDepartment" required>
						<option value="사이버보안과">사이버보안과</option>
						<option value="스마트금융과">스마트금융과</option>
						<option value="출판편집디자인과">출판편집디자인과</option>
					</select>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn-secondary" onclick="closeModal()">
						취소</button>

					<button type="submit">수정 완료</button>
				</div>
			</form>
		</div>
	</div>
	


	<script>
        // 페이지 로드 시 초기 데이터 로딩
        document.addEventListener('DOMContentLoaded', () => {
            refreshData();
        });

        // 전체 데이터 새로고침 함수
        function refreshData() {
            fetchStudents();
            fetchScores();
            fetchAverages();
        }

        // [기능 1] 학생 목록 조회
        async function fetchStudents() {
            try {
                const response = await fetch('${pageContext.request.contextPath}/students');
                const students = await response.json();
                
                const tbody = document.querySelector('#studentTable tbody');
                tbody.innerHTML = '';
                
                const select = document.getElementById('studentSelect');
                select.innerHTML = '<option value="">-- 학생을 선택하세요 --</option>';

                if (students.length === 0) {
                    tbody.innerHTML = '<tr><td colspan="5" class="empty-msg">등록된 학생이 없습니다.</td></tr>';
                    return;
                }

                students.forEach(student => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>\${student.id}</td>
                        <td>\${student.name}</td>
                        <td>\${student.phoneNumber}</td>
                        <td>\${student.department}</td>
                        <td>
                            <button class="btn-update" onclick='openUpdateModal(\${JSON.stringify(student)})'>수정</button>
                            <button class="btn-delete" onclick="deleteStudent(\${student.id})">삭제</button>
                        </td>
                    `;
                    tbody.appendChild(tr);

                    const option = document.createElement('option');
                    option.value = student.id;
                    option.textContent = student.name + " (" + student.phoneNumber + ")";
                    select.appendChild(option);
                });
            } catch (error) {
                console.error('Error fetching students:', error);
            }
        }

        // [기능 2] 성적 목록 조회
        async function fetchScores() {
            try {
                const response = await fetch('${pageContext.request.contextPath}/scores');
                const scores = await response.json();
                
                const tbody = document.querySelector('#scoreTable tbody');
                tbody.innerHTML = '';

                if (scores.length === 0) {
                    tbody.innerHTML = '<tr><td colspan="4" class="empty-msg">등록된 성적이 없습니다.</td></tr>';
                    return;
                }

                scores.forEach(score => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>\${score.studentName}</td>
                        <td>\${score.subject}</td>
                        <td>\${score.score}</td>
                        <td><strong>\${score.grade}</strong></td>
                    `;
                    tbody.appendChild(tr);
                });
            } catch (error) {
                console.error('Error fetching scores:', error);
            }
        }

        // [기능 3] 평균 결과 조회
        async function fetchAverages() {
            try {
                const response = await fetch('${pageContext.request.contextPath}/scores/averages');
                const averages = await response.json();
                
                const tbody = document.querySelector('#averageTable tbody');
                tbody.innerHTML = '';

                if (averages.length === 0) {
                    tbody.innerHTML = '<tr><td colspan="3" class="empty-msg">데이터가 부족합니다.</td></tr>';
                    return;
                }

                averages.forEach(avg => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>\${avg.studentName}</td>
                        <td>\${avg.averageScore.toFixed(2)}</td>
                        <td><span style="color: blue; font-weight: bold;">\${avg.finalGrade}</span></td>
                    `;
                    tbody.appendChild(tr);
                });
            } catch (error) {
                console.error('Error fetching averages:', error);
            }
        }

        // [기능 4] 학생 등록 이벤트
        document.getElementById('studentForm').addEventListener('submit', async (e) => {
            e.preventDefault();
            const data = {
                name: document.getElementById('name').value,
                phoneNumber: document.getElementById('phoneNumber').value,
                department: document.getElementById('department').value
            };

            try {
                const res = await fetch('${pageContext.request.contextPath}/students', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                if (res.ok) {
                    alert('학생이 등록되었습니다.');
                    document.getElementById('studentForm').reset();
                    refreshData();
                } else {
                    const errorMsg = await res.text();
                    alert('학생 등록 실패: ' + errorMsg);
                }
            } catch (error) { 
                console.error('Error:', error);
                alert('서버 연결 오류가 발생했습니다.');
            }
        });

        // [기능 5] 성적 등록 이벤트
        document.getElementById('scoreForm').addEventListener('submit', async (e) => {
            e.preventDefault();
            const data = {
                studentId: document.getElementById('studentSelect').value,
                subject: document.getElementById('subject').value,
                score: parseInt(document.getElementById('score').value)
            };

            try {
                const res = await fetch('${pageContext.request.contextPath}/scores', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                if (res.ok) {
                    alert('성적이 등록되었습니다.');
                    document.getElementById('scoreForm').reset();
                    refreshData();
                }
            } catch (error) { console.error('Error:', error); }
        });

        // [기능 6] 학생 삭제
        async function deleteStudent(id) {
            if (!confirm('학생을 삭제하시겠습니까? (관련 성적도 모두 삭제됩니다.)')) return;
            try {
                const res = await fetch(`${pageContext.request.contextPath}/students/\${id}`, {
                    method: 'DELETE'
                });
                if (res.ok) {
                    alert('삭제 완료');
                    refreshData();
                }
            } catch (error) { console.error('Error:', error); }
        }

        // [기능 7] 학생 수정 모달 열기
        function openUpdateModal(student) {
            document.getElementById('updateId').value = student.id;
            document.getElementById('updateName').value = student.name;
            document.getElementById('updatePhoneNumber').value = student.phoneNumber;
            document.getElementById('updateDepartment').value = student.department;
            document.getElementById('updateModal').style.display = 'block';
        }

        // 모달 닫기
        function closeModal() {
            document.getElementById('updateModal').style.display = 'none';
        }

        // [기능 8] 학생 수정 실행
        document.getElementById('updateForm').addEventListener('submit', async (e) => {
            e.preventDefault();
            const id = document.getElementById('updateId').value;
            const data = {
                name: document.getElementById('updateName').value,
                phoneNumber: document.getElementById('updatePhoneNumber').value,
                department: document.getElementById('updateDepartment').value
            };

            try {
                const res = await fetch(`${pageContext.request.contextPath}/students/\${id}`, {
                    method: 'PUT',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                if (res.ok) {
                    alert('전화번호가 수정되었습니다.');
                    closeModal();
                    refreshData();
                }
            } catch (error) {
                console.error('Error updating student:', error);
            }
        });
    </script>
</body>
</html>
