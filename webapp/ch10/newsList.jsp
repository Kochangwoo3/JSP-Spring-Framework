<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>���� ���� ��</title>
</head>
<body>
	<div class="container w-75 mt-5 mx-auto" >
		<h2>���� ���</h2>
		<hr />
		<ul class="list-group">
			<c:forEach var="news" items="${newslist}" varStatus="status">
				<li class="list-group-item  list-group-item-action d-flex justify-content-between align-items-center">
				    <a href="news.nhn?action=getNews&aid=${news.aid}" class="text-decoration-none">
				    	[${status.count}] ${news.title}, ${news.date}
				    </a>
				    <a href="news.nhn?action=deleteNews&aid=${news.aid}"><span class="badge bg-secondary">&times;</span></a>
				</li>
			</c:forEach>
		</ul>
		<hr />
		<!-- ���� ��º� -->
		<c:if test="${error != null}">
			<div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
			  ���� �߻� : ${error}
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
		<hr />
		<button type="button" class="btn btn-outline-info mb-3" data-bs-toggle="collapse"
		data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">���� ���</button>
		
		<div class="collapse" id="addForm">
			<div class="card card-body">
				<form method="post" action="/jwbook/news.nhn?action=addNews" enctype="multipart/form-data">
						<label class="form-label">����</label>
	  				<input class="form-control" type="text" name="title">
	  				<label class="form-label">�̹���</label>
	  				<input class="form-control" type="file" name="file">
				    <label class="form-label">��系��</label>
	  				<textarea class="form-control" name="content" cols="50" rows="5"></textarea>
	  				<button type="submit"  class="btn btn-success mt-3">����</button>
	  			</form>
			</div>
		</div>
		
	</div>
	
</body>
</html>