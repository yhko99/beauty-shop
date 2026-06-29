package kr.ac.kopo.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
}