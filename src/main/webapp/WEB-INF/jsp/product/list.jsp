<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>무신사 뷰티 상품 목록</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        .search-box { margin: 20px 0; }
        .search-box input, .search-box select { padding: 8px; margin-right: 5px; }
        .search-box button { padding: 8px 15px; background: #333; color: white; border: none; cursor: pointer; }
        .product-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-top: 20px; }
        .product-card { border: 1px solid #ddd; padding: 15px; border-radius: 5px; }
        .product-card h3 { font-size: 14px; margin: 0 0 8px 0; }
        .brand { color: #888; font-size: 12px; }
        .price { font-weight: bold; color: #e44; font-size: 16px; }
        .discount { color: #e44; font-size: 12px; }
        .original { text-decoration: line-through; color: #999; font-size: 12px; }
        .total { margin: 10px 0; color: #666; }
        a { text-decoration: none; color: inherit; }
        .product-card:hover { box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <h1>무신사 뷰티 상품 조회</h1>

    <!-- 검색/필터 -->
    <div class="search-box">
        <form action="/beauty-shop/product" method="get">
            <input type="text" name="keyword" value="${keyword}" placeholder="상품명 또는 브랜드 검색" size="30">
            <select name="orderBy">
                <option value="price" ${orderBy == 'price' ? 'selected' : ''}>가격 낮은순</option>
                <option value="discount" ${orderBy == 'discount' ? 'selected' : ''}>할인율 높은순</option>
                <option value="latest" ${orderBy == 'latest' ? 'selected' : ''}>최신순</option>
            </select>
            <button type="submit">검색</button>
        </form>
    </div>

    <div class="total">총 <strong>${totalCount}</strong>개 상품</div>

    <!-- 상품 목록 -->
    <div class="product-grid">
        <c:forEach var="product" items="${productList}">
            <a href="/beauty-shop/product/${product.productId}">
                <div class="product-card">
                    <p class="brand">${product.brandName}</p>
                    <h3>${product.productName}</h3>
                    <p class="original">${product.originalPrice}원</p>
                    <p>
                        <span class="discount">${product.discountRate}%</span>
                        <span class="price"> ${product.price}원</span>
                    </p>
                </div>
            </a>
        </c:forEach>
    </div>
</body>
</html>