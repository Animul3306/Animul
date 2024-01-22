package com.multi.animul.member;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	public void insert(MemberVO vo) {
		dao.insert(vo);
	}
	
	public void delete(MemberVO vo) {
		dao.delete(vo);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<MemberVO> all() {
		return dao.all();
	}

	public boolean login(MemberVO vo) {
		boolean isValid = false;

		MemberVO resultVo = dao.one(vo);
		try {
			if(resultVo != null) {
				isValid = BCrypt.checkpw(vo.getPassword(), resultVo.getPassword());
			}
		} catch(IllegalArgumentException e) { e.printStackTrace(); isValid = false;}

		return isValid;
	}

	public boolean selectId(MemberVO vo) {
		return dao.selectId(vo);
	}

	public boolean selectEmail(MemberVO vo) {
		return dao.selectEmail(vo);
	}

	public boolean selectNickname(MemberVO vo) {
		return dao.selectNickname(vo);
	}

	public int join(MemberVO vo) {
		String pwd = vo.getPassword();

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String hashedPwd = encoder.encode(pwd);

		vo.setPassword(hashedPwd);

		return dao.join(vo);
	}

	public int update(MemberVO vo) {
		String pwd = vo.getPassword();

		System.out.println("[Service]: " + vo.toString());

		if (pwd == "") {
			vo.setPassword(dao.getPassword(vo));
		} else {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String hashedPwd = encoder.encode(pwd);
			
			vo.setPassword(hashedPwd);
		}

//		System.out.println("[Service]: Password " + vo.getPassword());

		int result = dao.update(vo);
//		System.out.println("[Service] Result: " + result);

		return result;
	}

	public String findId(MemberVO vo) {
		return dao.findId(vo);
	}

	public Boolean findPwd(MemberVO vo) {
		return dao.findPwd(vo);
	}

	public int resetPwd(MemberVO vo) {
		String pwd = vo.getPassword();

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String hashedPwd = encoder.encode(pwd);

		vo.setPassword(hashedPwd);

		return dao.resetPwd(vo);
	}

	public MemberVO getUserInfoById(MemberVO vo) {
		// return dao.getUserInfoById(vo);
		MemberVO infoVO = dao.getUserInfoById(vo);

		// System.out.println("[Service] info:\n" + infoVO.toString());

		return infoVO;
	}

}
