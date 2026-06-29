package kr.ac.kopo.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.product.dao.MemberDAO;
import kr.ac.kopo.product.vo.MemberVO;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    // 회원가입
    public int join(MemberVO memberVO) {
        return memberDAO.insert(memberVO);
    }

    // 로그인
    public MemberVO login(MemberVO memberVO) {
        return memberDAO.selectOne(memberVO);
    }

    // 아이디 중복 체크
    public int idCheck(String memberId) {
        return memberDAO.selectCount(memberId);
    }

    // 얼굴 데이터 저장
    public int updateFaceDescriptor(MemberVO memberVO) {
        return memberDAO.updateFaceDescriptor(memberVO);
    }

    // 얼굴로 회원 찾기
    public MemberVO selectByFace(String memberId) {
        return memberDAO.selectByFace(memberId);
    }

    // 전체 회원 얼굴 데이터 조회
    public List<MemberVO> selectAllFace() {
        return memberDAO.selectAllFace();
    }
}