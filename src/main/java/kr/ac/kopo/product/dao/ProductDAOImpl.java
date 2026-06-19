package kr.ac.kopo.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<ProductVO> selectList(Map<String, Object> params) {
        return sqlSessionTemplate.selectList("product.dao.ProductDAO.selectList", params);
    }

    @Override
    public ProductVO selectOne(int productId) {
        return sqlSessionTemplate.selectOne("product.dao.ProductDAO.selectOne", productId);
    }

    @Override
    public int selectCount(Map<String, Object> params) {
        return sqlSessionTemplate.selectOne("product.dao.ProductDAO.selectCount", params);
    }
}