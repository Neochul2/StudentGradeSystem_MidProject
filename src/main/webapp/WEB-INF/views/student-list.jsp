<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록 조회 - 성적 관리 시스템</title>
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
    border-bottom: 2px solid #28a745;
    padding-bottom: 10px;
}

.search-box {
    margin-bottom: 20px;
    display: flex;
    gap: 10px;
}

input {
    padding: 10px;
    flex: 1;
    border: 1px solid #ced4da;
    border-radius: 4px;
}

button {
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
}

button:hover {
    background-color: #218838;
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

.nav-link {
    display: inline-block;
    margin-bottom: 20px;
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

.nav-link:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
    <div class="container">
        <a href="${pageContext.request.contextPath}/" class="nav-link">&larr; 메인으로 돌아가기</a>
        <h1>학생 목록 조회</h1>

        <div class="search-box">
            <input type="text" id="searchInput" placeholder="학생 이름을 입력하세요..." onkeyup="filterStudents()">
            <button onclick="filterStudents()">검색</button>
        </div>

        <table id="studentTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>학과</th>
                </tr>
            </thead>
            <tbody>
                <!-- 데이터 동적 추가 -->
            </tbody>
        </table>
    </div>

    <script>
        let allStudents = [];

        document.addEventListener('DOMContentLoaded', () => {
            fetchStudents();
        });

        async function fetchStudents() {
            try {
                const response = await fetch('${pageContext.request.contextPath}/students');
                allStudents = await response.json();
                renderTable(allStudents);
            } catch (error) {
                console.error('Error fetching students:', error);
            }
        }

        function renderTable(students) {
            const tbody = document.querySelector('#studentTable tbody');
            tbody.innerHTML = '';

            if (students.length === 0) {
                tbody.innerHTML = '<tr><td colspan="4" class="empty-msg">학생이 없습니다.</td></tr>';
                return;
            }

            students.forEach(student => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>\${student.id}</td>
                    <td>\${student.name}</td>
                    <td>\${student.phoneNumber}</td>
                    <td>\${student.department}</td>
                `;
                tbody.appendChild(tr);
            });
        }

        function filterStudents() {
            const query = document.getElementById('searchInput').value.toLowerCase();
            const filtered = allStudents.filter(s => 
                s.name.toLowerCase().includes(query) || 
                s.department.toLowerCase().includes(query) ||
                s.phoneNumber.includes(query)
            );
            renderTable(filtered);
        }
    </script>
</body>
</html>
