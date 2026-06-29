<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 수정</title>
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
    <h2>상품 수정</h2>
    <div class="form-box">
        <form action="/beauty-shop/product/edit" method="post">
            <input type="hidden" name="productId" value="${product.productId}">
            <label>상품명</label>
            <input type="text" name="productName" value="${product.productName}" required>
            <label>브랜드명</label>
            <input type="text" name="brandName" value="${product.brandName}" required>
            <label>가격</label>
            <input type="number" name="price" value="${product.price}" required>
            <label>정가</label>
            <input type="number" name="originalPrice" value="${product.originalPrice}" required>
            <label>할인율 (%)</label>
            <input type="number" name="discountRate" value="${product.discountRate}" required>
            <label>상품 URL</label>
            <input type="text" name="productUrl" value="${product.productUrl}">
            <button type="submit">수정 완료</button>
        </form>
    </div>
</body>
</html>