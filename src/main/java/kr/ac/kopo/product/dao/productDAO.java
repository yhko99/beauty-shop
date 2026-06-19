package kr.ac.kopo.product.dao;

import java.util.List;
import java.util.Map;
import kr.ac.kopo.product.vo.ProductVO;

public interface ProductDAO {

    // 상품 전체 목록 조회
    List<ProductVO> selectList(Map<String, Object> params);

    // 상품 상세 조회
    ProductVO selectOne(int productId);

    // 상품 전체 건수 조회 (페이징용)
    int selectCount(Map<String, Object> params);
}