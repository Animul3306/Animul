package com.multi.animul.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@RequestMapping("memberInsert")
	public void insert(MemberVO vo) {
		service.insert(vo);
	}
	
	@RequestMapping("memberDelete")
	public void delete(MemberVO vo) {
		service.delete(vo);
	}
	
	@RequestMapping("memberCount")
	public int count() {
		return service.count();
	}
	
	@RequestMapping("memberAll")
	public List<MemberVO> all() {
		return service.all();
	}

	@RequestMapping(value="/member/Login.do", method=RequestMethod.GET)
	public String LoginPage() {
		return "/member/login.jsp";
	}
	

	@RequestMapping(value="/member/Login.do", method=RequestMethod.POST)
	public String Login(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session) {
		String path = "";

		MemberVO vo = new MemberVO();

		vo.setId(id);
		vo.setPassword(password);

		int result = service.login(vo);

		if(result == 1) {
			session.setAttribute("loggedInUser", vo);

			path = "redirect:/main.jsp";
		}
		else {
			session.setAttribute("loginError", "Login Failed");
			path = "redirect:/member/login.jsp";
		}
		return path;
	}

	@RequestMapping(value="/member/Logout.do", method=RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/main.jsp";
	}
}
