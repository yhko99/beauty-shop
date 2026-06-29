package kr.ac.kopo.product.dao;

import kr.ac.kopo.product.vo.MemberVO;

public interface MemberDAO {

    // 회원가입
    int insert(MemberVO memberVO);

    // 로그인 (아이디+비밀번호로 조회)
    MemberVO selectOne(MemberVO memberVO);

    // 아이디 중복 체크
    int selectCount(String memberId);

    // 얼굴 데이터 저장
    int updateFaceDescriptor(MemberVO memberVO);

    // 얼굴로 회원 찾기
    MemberVO selectByFace(String memberId);

    // 전체 회원 얼굴 데이터 조회 (얼굴 인식용)
    java.util.List<MemberVO> selectAllFace();
}