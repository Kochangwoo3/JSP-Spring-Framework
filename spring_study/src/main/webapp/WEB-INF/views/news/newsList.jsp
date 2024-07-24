<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>뉴스 관리 리스트</title>
<style>

h1 {
    color: #333;
    font-weight: bold;
    text-align: center;
    margin-bottom: 1px;
    margin-left: 290px;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.navbar {
    background-color: #007bff;
}

.navbar-brand, .navbar-nav .nav-link {
    color: #fff;
}

.navbar-brand:hover, .navbar-nav .nav-link:hover {
    color: #ddd;
}

.container {
    max-width: 900px;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    padding: 30px;
    margin-top: 50px;
}

h2 {
    color: #333;
    font-weight: bold;
    text-align: center;
    margin-bottom: 30px;
}

.list-group-item {
    border: none;
    border-bottom: 1px solid #e9ecef;
    padding: 15px 20px;
    transition: background-color 0.3s ease-in-out;
}

.list-group-item:hover {
    background-color: #f1f1f1;
}

.text-danger {
    font-size: 20px;
}

.alert {
    margin-top: 20px;
}

.btn-outline-info, .btn-success {
    border-radius: 30px;
    transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

.btn-outline-info:hover {
    background-color: #17a2b8;
    color: #fff;
}

.btn-success {
    background-color: #28a745;
    border-color: #28a745;
}

.btn-success:hover {
    background-color: #218838;
    border-color: #1e7e34;
}

.card {
    border: none;
    border-radius: 10px;
}

.card-body {
    background-color: #f8f9fa;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

.form-label {
    font-weight: bold;
    color: #495057;
}

.footer {
    text-align: center;
    margin-top: 50px;
    font-size: 14px;
    color: #999;
}

.error-message {
    background-color: #f8d7da;
    color: #721c24;
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 20px;
    border: 1px solid #f5c6cb;
    text-align: center;
}

.news-list-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
}

.news-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    border-bottom: 1px solid #e9ecef;
    transition: background-color 0.3s ease-in-out;
}

.news-item:hover {
    background-color: #f1f1f1;
}

.news-item a {
    color: #333;
    text-decoration: none;
    font-size: 18px;
}

.news-item a:hover {
    text-decoration: underline;
}

.news-item .delete-button {
    color: #ff6b6b;
    font-size: 24px;
    cursor: pointer;
    transition: color 0.3s ease-in-out;
}

.news-item .delete-button:hover {
    color: #ff1c1c;
}

.add-news-button {
    width: 100%;
    margin-top: 20px;
    padding: 15px;
    border-radius: 50px;
    font-size: 18px;
    transition: background-color 0.3s ease-in-out;
}

.add-news-button:hover {
    background-color: #007bff;
    color: #fff;
}

.collapse-container {
    margin-top: 30px;
}

.form-label {
    font-weight: bold;
    color: #495057;
    margin-bottom: 10px;
}

.form-control {
    border-radius: 10px;
    padding: 10px 15px;
    font-size: 16px;
    margin-bottom: 20px;
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.form-textarea {
    height: 150px;
    resize: none;
}

.submit-button {
    width: 100%;
    padding: 15px;
    border-radius: 50px;
    font-size: 18px;
    transition: background-color 0.3s ease-in-out;
}

.submit-button:hover {
    background-color: #218838;
    color: #fff;
}

.news-card {
    margin-bottom: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.news-card img {
    border-radius: 15px 15px 0 0;
    max-height: 400px;
    object-fit: cover;
}

.news-card .card-body {
    padding: 20px;
}

.news-card .card-title {
    font-size: 24px;
    margin-bottom: 10px;
}

.news-card .card-text {
    font-size: 16px;
    color: #555;
}

.news-card .news-date {
    font-size: 14px;
    color: #999;
    margin-bottom: 20px;
}

.back-button {
    margin-top: 20px;
    font-size: 16px;
    border-radius: 50px;
    transition: background-color 0.3s ease-in-out;
}

.back-button:hover {
    background-color: #0056b3;
    color: #fff;
}

.footer {
    margin-top: 50px;
    text-align: center;
    color: #999;
    font-size: 14px;
}
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <h1>뉴스관리리스트</h1>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/news/list"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#addForm"></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5 p-4 bg-light rounded-3 shadow">
        <h2 class="text-center mb-4"></h2>
        <ul class="list-group mb-4">
            <c:forEach var="news" items="${newslist}" varStatus="status">
                <li class="list-group-item list-group-item-action news-item">
                    <a href="/news/${news.aid}" class="text-decoration-none text-dark">
                        [${status.count}] ${news.title}, ${news.date}
                    </a>
                    <span class="delete-button" onclick="deleteNews(${news.aid})">&times;</span>
                </li>
            </c:forEach>
        </ul>
        <c:if test="${error != null}">
            <div class="error-message">
                <strong>에러 발생 :</strong> ${error}
            </div>
        </c:if>
        <button type="button" class="btn btn-outline-info add-news-button" data-bs-toggle="collapse"
        data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">뉴스 등록</button>

        <div class="collapse collapse-container" id="addForm">
            <div class="card card-body">
                <form method="post" action="/news/add" enctype="multipart/form-data">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                    <label for="file" class="form-label">이미지</label>
                    <input type="file" class="form-control" id="file" name="file" required>
                    <label for="content" class="form-label">기사내용</label>
                    <textarea class="form-control form-textarea" id="content" name="content" required></textarea>
                    <button type="submit" class="btn btn-success submit-button mt-3">저장</button>
                </form>
            </div>
        </div>
    </div>

    <div class="container news-card">
        <a href="javascript:history.back()" class="btn btn-primary back-button mt-3">&lt;&lt; Back</a>
    </div>

    <div class="footer mt-5">
        &copy; 2024 뉴스 관리 리스트. All rights reserved.
    </div>

    <script>
    function deleteNews(newsId) {
        if (confirm('정말 이 뉴스를 삭제하시겠습니까?')) {
            window.location.href = '/news/delete/' + newsId;
        }
    }
    </script>
</body>
</html>