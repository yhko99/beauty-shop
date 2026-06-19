package kr.ac.kopo.product.dao;

import java.util.List;
import java.util.Map;
import kr.ac.kopo.product.vo.ReviewVO;

public interface ReviewDAO {

    // 상품별 리뷰 목록 조회
    List<ReviewVO> selectListByProduct(Map<String, Object> params);

    // 상품별 리뷰 건수
    int selectCountByProduct(int productId);
}