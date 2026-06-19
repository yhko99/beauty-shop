package kr.ac.kopo.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.product.dao.ProductDAO;
import kr.ac.kopo.product.dao.ReviewDAO;
import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.product.vo.ReviewVO;

@Service
public class ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private ReviewDAO reviewDAO;

    // 상품 목록 조회
    public List<ProductVO> selectList(Map<String, Object> params) {
        return productDAO.selectList(params);
    }

    // 상품 상세 조회
    public ProductVO selectOne(int productId) {
        return productDAO.selectOne(productId);
    }

    // 상품 전체 건수
    public int selectCount(Map<String, Object> params) {
        return productDAO.selectCount(params);
    }

    // 상품별 리뷰 목록
    public List<ReviewVO> selectReviewList(Map<String, Object> params) {
        return reviewDAO.selectListByProduct(params);
    }

    // 상품별 리뷰 건수
    public int selectReviewCount(int productId) {
        return reviewDAO.selectCountByProduct(productId);
    }
}