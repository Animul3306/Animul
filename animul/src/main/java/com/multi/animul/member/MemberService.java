package com.multi.animul.member;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
}
