<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 추가</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h2 { color: #333; }
        .form-box { width: 500px; }
        .form-box input { width: 100%; padding: 8px; margin: 5px 0 15px 0; box-sizing: border-box; border: 1px solid #ddd; border-radius: 4px; }
        .form-box button { padding: 10px 20px; background: #333; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 15px; }
        .back { margin-bottom: 20px; }
        .back a { color: #333; text-decoration: none; }
    </style>
</head>
<body>
    <div class="back"><a href="/beauty-shop/product">← 목록으로</a></div>
    <h2>상품 추가</h2>
    <div class="form-box">
        <form action="/beauty-shop/product/add" method="post">
            <label>상품 ID</label>
            <input type="number" name="productId" placeholder="상품 ID 입력" required>
            <label>상품명</label>
            <input type="text" name="productName" placeholder="상품명 입력" required>
            <label>브랜드명</label>
            <input type="text" name="brandName" placeholder="브랜드명 입력" required>
            <label>가격</label>
            <input type="number" name="price" placeholder="가격 입력" required>
            <label>정가</label>
            <input type="number" name="originalPrice" placeholder="정가 입력" required>
            <label>할인율 (%)</label>
            <input type="number" name="discountRate" placeholder="할인율 입력" required>
            <label>상품 URL</label>
            <input type="text" name="productUrl" placeholder="상품 URL 입력">
            <button type="submit">상품 추가</button>
        </form>
    </div>
</body>
</html>