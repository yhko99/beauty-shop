package kr.ac.kopo.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.product.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<ReviewVO> selectListByProduct(Map<String, Object> params) {
        return sqlSessionTemplate.selectList("product.dao.ReviewDAO.selectListByProduct", params);
    }

    @Override
    public int selectCountByProduct(int productId) {
        return sqlSessionTemplate.selectOne("product.dao.ReviewDAO.selectCountByProduct", productId);
    }
}