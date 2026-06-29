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

    public List<ProductVO> selectList(Map<String, Object> params) {
        return productDAO.selectList(params);
    }

    public ProductVO selectOne(int productId) {
        return productDAO.selectOne(productId);
    }

    public int selectCount(Map<String, Object> params) {
        return productDAO.selectCount(params);
    }

    public List<ReviewVO> selectReviewList(Map<String, Object> params) {
        return reviewDAO.selectListByProduct(params);
    }

    public int selectReviewCount(int productId) {
        return reviewDAO.selectCountByProduct(productId);
    }

    // 상품 추가
    public int insert(ProductVO productVO) {
        return productDAO.insert(productVO);
    }

    // 상품 수정
    public int update(ProductVO productVO) {
        return productDAO.update(productVO);
    }

    // 상품 삭제
    public int delete(int productId) {
        return productDAO.delete(productId);
    }
}