package kr.ac.kopo.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.product.service.MemberService;
import kr.ac.kopo.product.vo.MemberVO;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 회원가입 폼
    @GetMapping("/member/joinForm")
    public String joinForm() {
        return "member/joinForm";
    }

    // 회원가입 처리
    @PostMapping("/member/join")
    public String join(MemberVO memberVO) {
        int cnt = memberService.idCheck(memberVO.getMemberId());
        if (cnt > 0) {
            return "redirect:/member/joinForm";
        }
        memberService.join(memberVO);
        return "redirect:/member/loginForm";
    }

    // 로그인 폼
    @GetMapping("/member/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    // 로그인 처리
    @PostMapping("/member/login")
    public String login(MemberVO memberVO, HttpSession session) {
        MemberVO loginMember = memberService.login(memberVO);
        if (loginMember == null) {
            return "redirect:/member/loginForm";
        }
        session.setAttribute("loginMember", loginMember);
        return "redirect:/product";
    }

    // 로그아웃
    @GetMapping("/member/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/product";
    }

    // 얼굴 등록 폼
    @GetMapping("/member/faceRegist")
    public String faceRegist() {
        return "member/faceRegist";
    }

    // 얼굴 데이터 저장 (AJAX)
    @PostMapping("/member/saveFace")
    @ResponseBody
    public String saveFace(@RequestBody MemberVO memberVO, HttpSession session) {
        MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "fail";
        }
        memberVO.setMemberId(loginMember.getMemberId());
        memberService.updateFaceDescriptor(memberVO);
        return "success";
    }

    // 전체 얼굴 데이터 조회 (얼굴 로그인용)
    @GetMapping("/member/getFaceData")
    @ResponseBody
    public List<MemberVO> getFaceData() {
        return memberService.selectAllFace();
    }

    // 얼굴 로그인 처리
    @PostMapping("/member/faceLogin")
    @ResponseBody
    public String faceLogin(@RequestBody MemberVO memberVO, HttpSession session) {
        MemberVO loginMember = memberService.selectByFace(memberVO.getMemberId());
        if (loginMember == null) {
            return "fail";
        }
        session.setAttribute("loginMember", loginMember);
        return "success";
    }

    // 얼굴 로그인 폼
    @GetMapping("/member/faceLoginForm")
    public String faceLoginForm() {
        return "member/faceLoginForm";
    }
}