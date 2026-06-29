package kr.ac.kopo.product.dao;

import kr.ac.kopo.product.vo.MemberVO;

public interface MemberDAO {

    // 회원가입
    int insert(MemberVO memberVO);

    // 로그인 (아이디+비밀번호로 조회)
    MemberVO selectOne(MemberVO memberVO);

    // 아이디 중복 체크
    int selectCount(String memberId);
}