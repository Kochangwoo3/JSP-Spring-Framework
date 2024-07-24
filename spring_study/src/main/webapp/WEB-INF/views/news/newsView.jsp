<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 관리 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
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

.card {
    border-radius: 15px;
    overflow: hidden;
    border: none;
    margin-bottom: 20px;
}

.card-img-top {
    max-height: 400px;
    object-fit: cover;
    border-bottom: 1px solid #e9ecef;
}

.card-body {
    padding: 25px;
}

.card-title {
    color: #333;
    font-weight: bold;
    font-size: 24px;
    margin-bottom: 10px;
}

.text-muted {
    font-size: 14px;
    margin-bottom: 15px;
}

.card-text {
    font-size: 16px;
    line-height: 1.8;
    color: #555;
    margin-bottom: 20px;
}

.btn-primary, .btn-outline-secondary {
    width: 100%;
    font-size: 16px;
    padding: 10px 0;
    transition: all 0.3s ease-in-out;
    border-radius: 50px;
}

.btn-primary {
    background-color: #007bff;
    border: none;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-outline-secondary {
    border: 2px solid #6c757d;
    color: #6c757d;
}

.btn-outline-secondary:hover {
    background-color: #6c757d;
    color: #fff;
}

.footer {
    text-align: center;
    margin-top: 30px;
    font-size: 14px;
    color: #999;
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

.error-message {
    background-color: #f8d7da;
    color: #721c24;
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 20px;
    border: 1px solid #f5c6cb;
    text-align: center;
}

</style>
</head>
<body>
    <div class="container">
        <h2>뉴스 관리 리스트</h2>
        <a href="/news/list" class="btn btn-outline-secondary mb-4">뉴스 목록으로 이동</a>
        <div class="card shadow-lg mb-4">
            <img src="${news.img}" class="card-img-top img-fluid" alt="뉴스 이미지">
            <div class="card-body">
                <h4 class="card-title">${news.title}</h4>
                <h6 class="text-muted">Date: ${news.date}</h6>
                <p class="card-text">${news.content}</p>
            </div>
        </div>
        <a href="javascript:history.back()" class="btn btn-primary mt-3">&lt;&lt; Back</a>
    </div>

    <div class="news-list-container mt-5">
        <h2 class="text-center mb-4">뉴스 목록</h2>
        <ul class="list-group">
            <c:forEach var="news" items="${newslist}" varStatus="status">
                <li class="list-group-item list-group-item-action news-item">
                    <a href="/news/${news.aid}">
                        [${status.count}] ${news.title}, ${news.date}
                    </a>
                    <span class="delete-button" onclick="deleteNews(${news.aid})">&times;</span>
                </li>
            </c:forEach>
        </ul>
        <button type="button" class="btn btn-outline-info add-news-button" data-bs-toggle="collapse" data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">뉴스 등록</button>
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