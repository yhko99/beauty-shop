<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.productName}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .back { margin-bottom: 20px; }
        .back a { color: #333; text-decoration: none; }
        .product-info { border: 1px solid #ddd; padding: 20px; border-radius: 5px; margin-bottom: 30px; }
        .product-info h2 { margin: 0 0 10px 0; }
        .brand { color: #888; margin-bottom: 10px; }
        .price-box { margin: 15px 0; }
        .price { font-size: 24px; font-weight: bold; color: #e44; }
        .discount { color: #e44; margin-right: 10px; }
        .original { text-decoration: line-through; color: #999; font-size: 14px; }
        .review-section h3 { border-bottom: 2px solid #333; padding-bottom: 10px; }
        .review-card { border: 1px solid #eee; padding: 15px; margin-bottom: 10px; border-radius: 5px; }
        .review-header { display: flex; justify-content: space-between; margin-bottom: 8px; }
        .nickname { font-weight: bold; }
        .rating { color: #f90; }
        .sentiment-긍정 { color: #2a2; font-size: 12px; }
        .sentiment-부정 { color: #e44; font-size: 12px; }
        .sentiment-중립 { color: #888; font-size: 12px; }
        .skin-info { font-size: 12px; color: #666; margin: 5px 0; }
        .review-text { margin-top: 8px; line-height: 1.6; }
        .paging { margin-top: 20px; text-align: center; }
        .paging a { margin: 0 5px; padding: 5px 10px; border: 1px solid #ddd; text-decoration: none; color: #333; }
        .paging a.active { background: #333; color: white; }
    </style>
</head>
<body>
    <div class="back"><a href="/beauty-shop/product">← 목록으로</a></div>

    <!-- 상품 정보 -->
    <div class="product-info">
        <p class="brand">${product.brandName}</p>
        <h2>${product.productName}</h2>
        <div class="price-box">
            <span class="original">${product.originalPrice}원</span>
            <span class="discount"> ${product.discountRate}%</span>
            <span class="price"> ${product.price}원</span>
        </div>
        <a href="${product.productUrl}" target="_blank">무신사에서 보기 →</a>
    </div>

    <!-- 리뷰 목록 -->
    <div class="review-section">
        <h3>리뷰 (${reviewCount}개)</h3>

        <c:forEach var="review" items="${reviewList}">
            <div class="review-card">
                <div class="review-header">
                    <span class="nickname">${review.nickname}</span>
                    <span>
                        <span class="rating">★ ${review.rating}</span>
                        <span class="sentiment-${review.sentiment}">[${review.sentiment}]</span>
                        <span style="color:#999; font-size:12px;">${review.reviewDate}</span>
                    </span>
                </div>
                <c:if test="${not empty review.skinRaw}">
                    <p class="skin-info">🧴 ${review.skinRaw}</p>
                </c:if>
                <c:if test="${not empty review.satisfaction}">
                    <p class="skin-info">✓ ${review.satisfaction}</p>
                </c:if>
                <p class="review-text">${review.reviewText}</p>
            </div>
        </c:forEach>

        <!-- 페이징 -->
        <div class="paging">
            <c:forEach begin="1" end="${totalPage}" var="i">
                <a href="/beauty-shop/product/${product.productId}?page=${i}"
                   class="${page == i ? 'active' : ''}">${i}</a>
            </c:forEach>
        </div>
    </div>
</body>
</html>