package com.multi.animul.member;

import com.multi.animul.member.KakaoUtils;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.core.OAuth2Token;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
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
	public String Login(@RequestParam("id") String id, @RequestParam("password") String password, boolean rememberId, HttpSession session, HttpServletResponse response) {
		String path = "";

		MemberVO vo = new MemberVO();

		vo.setId(id);
		vo.setPassword(password);
		
		boolean result = service.login(vo);
		
		if (result) {
		    session.setAttribute("loggedInUser", vo.getId());

		    if (rememberId) {
		        Cookie cookie = new Cookie("rememberedId", vo.getId());
		        response.addCookie(cookie);
		    } else {
		        Cookie deleteCookie = new Cookie("rememberedId", "");
		        deleteCookie.setMaxAge(0);
		        response.addCookie(deleteCookie);
		    }

		    path = "redirect:/main.jsp";
		}
		else {
			session.setAttribute("loginError", "Login Failed");
       
			path = "redirect:/member/login.jsp";
		}
		return path;
	}

	@RequestMapping(value="/member/checkSessionStatus.do")
	public ResponseEntity<String> checkSessionStatus(HttpSession session) {
		if ( session.getAttribute("loggedInUser") != null) {

            return ResponseEntity.ok("SESSION_VALID");
        } else {
 
            return ResponseEntity.ok("SESSION_EXPIRED");
        }
	}
	
	@RequestMapping(value="/member/Logout.do", method=RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/main.jsp";
	}

	@RequestMapping(value="/member/ConfirmId.do", method=RequestMethod.POST) 
	public ResponseEntity<Boolean> confirmId(String id) {
		boolean result = true;
		
		if (id.trim().isEmpty()) {
			result = false;
		} else {
			MemberVO vo = new MemberVO();
			vo.setId(id);

			if (service.selectId(vo)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@RequestMapping(value="/member/ConfirmEmail.do", method=RequestMethod.POST)
	public ResponseEntity<Boolean> confirmEmail(String email) {
		boolean result = true;

		if (email.trim().isEmpty()) {
			result = false;
		} else {
			MemberVO vo = new MemberVO();
			vo.setMember_email(email);

			if (service.selectEmail(vo)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@RequestMapping(value="/member/ConfirmNickname.do", method=RequestMethod.POST)
	public ResponseEntity<Boolean> confirmNickname(String nickname) {
		boolean result = true;

		if (nickname.trim().isEmpty()) {
			result = false;
		} else {
			MemberVO vo = new MemberVO();

			if (service.selectNickname(vo)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@RequestMapping(value="/member/Join.do", method=RequestMethod.POST)
	public String Join(@RequestParam("id") String id, @RequestParam("password") String password, @RequestParam("name") String name, Date birth, String gender, int age, @RequestParam("email") String email, @RequestParam("nickname") String nickname, HttpSession session) {
		String path = "";

		MemberVO vo = new MemberVO();

		vo.setId(id);
		vo.setPassword(password);
		vo.setMember_name(name);
		vo.setMember_birthday(birth);
		vo.setMember_gender(gender);
		vo.setMember_age(age);
		vo.setMember_email(email);
		vo.setMember_nickname(nickname);

		int result = service.join(vo);

		if(result == 1) {
			session.setAttribute("loggedInUser", vo.getId());

			path = "redirect:/main.jsp";
		}
		else {
			session.setAttribute("loginError", "Login Failed");
			path = "redirect:/member/login.jsp";
		}

		return path;
	}

	@RequestMapping(value="/member/Update.do", method=RequestMethod.POST)
	public ResponseEntity<String> Update(String password, String name, Date birth, String gender, int age, String email, String nickname, HttpSession session) {
		MemberVO vo = new MemberVO();
		String userId = (String)session.getAttribute("loggedInUser");

		if (userId == null) { return ResponseEntity.status(HttpStatus.FORBIDDEN).build(); }

		vo.setId(userId);
		vo.setPassword(password);
		vo.setMember_name(name);
		vo.setMember_birthday(birth);
		vo.setMember_gender(gender);
		vo.setMember_age(age);
		vo.setMember_email(email);
		vo.setMember_nickname(nickname);
		
		// System.out.println("[Controller] Update: " + vo.toString());

		int result = service.update(vo);

		// System.out.println("[Controller] Result: " + result);

		if(result == 1) {
			return ResponseEntity.ok("");
		}
		else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
		}

	}

	@RequestMapping(value="/member/FindId.do", method=RequestMethod.GET)
	public ResponseEntity<String> FindId(@RequestParam("name") String name, @RequestParam("email") String email) {
		MemberVO vo = new MemberVO();

		vo.setMember_name(name);
		vo.setMember_email(email);

		String result = service.findId(vo);

		return ResponseEntity.ok(result);
	}

	@RequestMapping(value="/member/FindPwd.do", method=RequestMethod.GET)
	public ResponseEntity<Boolean> FindPwd(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("email") String email) {
		MemberVO vo = new MemberVO();

		vo.setId(id);
		vo.setMember_name(name);
		vo.setMember_email(email);

		Boolean result = service.findPwd(vo);

		return ResponseEntity.ok(result);
	}

	@RequestMapping(value="/member/ResetPwd.do", method=RequestMethod.POST)
	public String ResetPwd(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		String path = "";
		MemberVO vo = new MemberVO();
		
		vo.setId(id);
		vo.setPassword(pwd);

		System.out.println("VO: " + vo.toString());

		int updateResult = service.resetPwd(vo);

		System.out.println("Controller Reply: " + updateResult);

		if (updateResult == 1) {
			path = "redirect:/member/login.jsp";
		} else {
			path = "redirect:/member/forgot.jsp";
		}

		return path;
	}

	@RequestMapping(value="/member/naverLogin/OAuth2C", method=RequestMethod.GET)
	public String naverLogin() {
		

		return "redirect:/main.jsp";
	}

	// private KakaoUtils kakaoUtils = new KakaoUtils();

	@RequestMapping(value="/member/kakaoLogin/OAuth2C", method=RequestMethod.GET)
	public String kakaoLoginCallback(@RequestParam String code) {
		System.out.println("Code: " + code);

		// OAuth2Token accessToken = KakaoUtils.getOAuthToken(code);

		// System.out.println("accessToken = " + accessToken.getTokenValue());
 
		String accessToken = KakaoUtils.getAccessToken(code);
		System.out.println("accessToken = " + accessToken);

		return "redirect:/main.jsp";
	}

	@RequestMapping(value="/member/userInfo.do", method=RequestMethod.GET)
	public ResponseEntity<MemberVO> getUserInfo(HttpSession session) {
		String userId = (String) session.getAttribute("loggedInUser");

		if (userId == null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}

		MemberVO vo = new MemberVO();
		vo.setId(userId);

		// System.out.println("[Controller] ID: " + vo.getId());

		MemberVO infoVO = service.getUserInfoById(vo);
		infoVO.setId(userId);

		// System.out.println("[Controller] info: " + infoVO.toString());

		return ResponseEntity.ok(infoVO);
	}

	@RequestMapping(value="/member/withdrawal.do", method=RequestMethod.POST)
	public String withdrawal(HttpSession session) {
		MemberVO vo = new MemberVO();
		vo.setId((String) session.getAttribute("loggedInUser"));

		service.delete(vo);
		session.invalidate();

		return "redirect:/member/alert-withdrawal.jsp";
	}

	@RequestMapping(value="/member/withdrawal-redirect.do", method=RequestMethod.POST)
	public String requestMethodName(@RequestParam String param) {
		return "redirect:main.jsp";
	}
}