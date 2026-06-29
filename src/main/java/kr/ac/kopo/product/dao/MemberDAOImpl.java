package kr.ac.kopo.product.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.product.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int insert(MemberVO memberVO) {
        return sqlSessionTemplate.insert("member.dao.MemberDAO.insert", memberVO);
    }

    @Override
    public MemberVO selectOne(MemberVO memberVO) {
        return sqlSessionTemplate.selectOne("member.dao.MemberDAO.selectOne", memberVO);
    }

    @Override
    public int selectCount(String memberId) {
        return sqlSessionTemplate.selectOne("member.dao.MemberDAO.selectCount", memberId);
    }
}