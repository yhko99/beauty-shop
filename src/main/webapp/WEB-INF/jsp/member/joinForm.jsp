<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h2 { color: #333; }
        .form-box { width: 400px; }
        .form-box input { width: 100%; padding: 8px; margin: 5px 0 15px 0; box-sizing: border-box; border: 1px solid #ddd; border-radius: 4px; }
        .form-box button { width: 100%; padding: 10px; background: #333; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 15px; }
        .form-box button:hover { background: #555; }
        .link { margin-top: 15px; text-align: center; }
        .link a { color: #333; }
    </style>
</head>
<body>
    <h2>회원가입</h2>
    <div class="form-box">
        <form action="/beauty-shop/member/join" method="post">
            <label>아이디</label>
            <input type="text" name="memberId" placeholder="아이디 입력" required>
            <label>비밀번호</label>
            <input type="password" name="memberPw" placeholder="비밀번호 입력" required>
            <label>이름</label>
            <input type="text" name="memberName" placeholder="이름 입력" required>
            <label>이메일</label>
            <input type="email" name="memberEmail" placeholder="이메일 입력">
            <button type="submit">회원가입</button>
        </form>
        <div class="link">
            <a href="/beauty-shop/member/loginForm">이미 계정이 있으신가요? 로그인</a>
        </div>
    </div>
</body>
</html>