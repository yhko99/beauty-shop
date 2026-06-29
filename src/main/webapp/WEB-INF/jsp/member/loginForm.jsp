<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h2 { color: #333; }
        .form-box { width: 400px; }
        .form-box input { width: 100%; padding: 8px; margin: 5px 0 15px 0; box-sizing: border-box; border: 1px solid #ddd; border-radius: 4px; }
        .form-box button { width: 100%; padding: 10px; background: #333; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 15px; }
        .form-box button:hover { background: #555; }
        .face-btn { width: 100%; padding: 10px; background: #47a; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 15px; margin-top: 10px; }
        .face-btn:hover { background: #369; }
        .link { margin-top: 15px; text-align: center; }
        .link a { color: #333; margin: 0 10px; }
    </style>
</head>
<body>
    <h2>로그인</h2>
    <div class="form-box">
        <form action="/beauty-shop/member/login" method="post">
            <label>아이디</label>
            <input type="text" name="memberId" placeholder="아이디 입력" required>
            <label>비밀번호</label>
            <input type="password" name="memberPw" placeholder="비밀번호 입력" required>
            <button type="submit">로그인</button>
        </form>
        <button class="face-btn" onclick="location.href='/beauty-shop/member/faceLoginForm'">
            📷 얼굴로 로그인
        </button>
        <div class="link">
            <a href="/beauty-shop/member/joinForm">계정이 없으신가요? 회원가입</a>
        </div>
    </div>
</body>
</html>