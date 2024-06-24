<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>첫걸음교회</title>
    <link rel="stylesheet" href="styles.css">
    <img src="image.png">
</head>
<body>
	<header>
		<div class="container">
				<nav>
						<ul>
								<li><a href="#about">교회 소개</a></li>
								<li><a href="#services">예배 시간</a></li>
								<li><a href="#contact">연락처</a></li>
								<li><a href="http://127.0.0.1:5500/프로젝트/공휴일식사나눔운동본부%20활동사진.html" target="_blank">공휴일식사나눔운동본부 활동사진</a></li>
						</ul>
				</nav>
		</div>
</header>

<section id="about">
		<div class="container">
				<h2>교회 소개</h2>
				<p>노원구 상계동에 위치한 대한예수교장로회 첫걸음교회입니다:)<br><br>

					🙋‍ 전교인이 함께 사역을 이루어 가는 '교인교회'<br>
					👨‍ 상처에 반창고가 되어주는 '이웃교회'<br>
					🧕 건축보다 인류애에 관심있는 '인류교회'<br>
					📚 성경이 삶의 기준인 '복음교회'<br>
					<br>
					서울시 노원구 동일로 1382 4층.</p>

					첫걸음교회 유튜브 : <a href="https://www.youtube.com/channel/UCvZF4uK91Dd6JbCHx6-Sb2Q" target="_blank">첫걸음교회 유튜브</a></p>

					첫걸음교회 인스타 : <a href="https://www.instagram.com/alphag.20/" target="_blank">첫걸음교회 인스타그램</a></p>
		</div>
</section>

<section id="services">
		<div class="container">
				<h2>예배 시간</h2>
				<ul>
						<li>주일 예배: 매주 일요일 오전 11시</li>
						<li>수요 예배: 매수 수요일 오후 8시</li>
				</ul>
		</div>
</section>

<section id="contact">
		<div class="container">
			<h2>연락처</h2>
			<ul>
					<li>010-8943-9068</li>
			</ul>
	</div>
</section>

<section id="contact">
	<div class="container">
		<h2></h2>
		<ul>
				
		</ul>
</div>
</section>

<footer>
		<div class="container">
				<p><섬기는 사람들></p>
				<p>담임목사 : 김대영</p>
				<p>전도사 : 박희지</p>
				<p>행동으로 실천하는 첫걸음교회! 직접 오셔서 느껴보십시요!</p>
		</div>
</footer>

<script src="scripts.js"></script>
</body>
</html>
</body>
</html>

body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  line-height: 1.6;
}

.container {
  width: 80%;
  margin: auto;
  overflow: hidden;
  position: relative;
}

header {
  background: #333;
  color: #fff;
  padding-top: 30px;
  min-height: 70px;
  border-bottom: #77aaff 3px solid;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

header h1 {
  margin: 0;
}

header nav {
  margin-top: 10px;
}

header ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

header li {
  display: inline;
  margin: 0 20px;
}

header a {
  color: #fff;
  text-decoration: none;
  font-weight: bold;
}

header a:hover {
  color: #77aaff;
}

.logo img {
  width: 100px; /* 로고 이미지 크기를 적절히 조절하세요 */
  height: auto;
  position: absolute;
  top: 10px;
  right: 20px;
}

section {
  padding: 20px 0;
  border-bottom: #ccc 1px solid;
}

section h2 {
  text-align: center;
  color: #333;
}

footer {
  padding: 20px;
  background: #333;
  color: #fff;
  text-align: center;
}

#contact-form {
  display: flex;
  flex-direction: column;
  width: 50%;
  margin: auto;
}

#contact-form label {
  margin-top: 10px;
}

#contact-form input, #contact-form textarea {
  padding: 10px;
  margin-top: 5px;
}

#contact-form button {
  margin-top: 10px;
  padding: 10px;
  background: #77aaff;
  border: 0;
  color: #fff;
  cursor: pointer;
}

#contact-form button:hover {
  background: #5599dd;
}
