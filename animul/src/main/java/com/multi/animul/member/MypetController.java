package com.multi.animul.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MypetController {
	@Autowired
	MypetService service;
	
	@PostMapping("/mypet/addPet.do")
	public String insert(String name, String owner_id, String category, String variety, String gender, String birth, String weight, String neutralization) {
		MypetVO vo = new MypetVO();

		vo.setMypet_name(name);
		vo.setMypet_owner(owner_id);
		vo.setMypet_category(category);
		vo.setMypet_variety(variety);
		vo.setMypet_gender(gender);
		vo.setMypet_birthday(birth);
		vo.setMypet_weight(Double.parseDouble(weight));
		vo.setIs_neutralization( (neutralization == "true") ? true : false );

		System.out.println(vo);

		int result = service.insert(vo);

		if (result == 1) { return "redirect:../member/mypage-mypet.jsp"; }
		else { return "redirect:../member/mypage-mypetAdd.jsp"; }
	}

	@PostMapping("/mypet/update.do")
	public String update(String id, String name, String category, String variety, String gender, String birth, String weight, String neutralization) {
		MypetVO vo = new MypetVO();

		vo.setMypet_id(Integer.parseInt(id));
		vo.setMypet_name(name);
		vo.setMypet_category(category);
		vo.setMypet_variety(variety);
		vo.setMypet_gender(gender);
		vo.setMypet_birthday(birth);
		// System.out.println(weight);
		vo.setMypet_weight(Double.parseDouble(weight));
		vo.setIs_neutralization( (neutralization == "true") ? true : false );

		// System.out.println(vo);

		int result = service.update(vo);

		if (result == 1) { return "redirect:../member/mypage-mypet.jsp"; }
		else { return "redirect:../member/mypage-mypetModify.jsp"; }
	}
	
	@GetMapping("/mypet/simple_inquiry.do")
	public ResponseEntity<List<MypetVO>> simple_inquiry(HttpSession session) {
		MypetVO vo = new MypetVO();
		vo.setMypet_owner((String)session.getAttribute("loggedInUser"));

		return ResponseEntity.ok(service.simple_inquiry(vo));
	}

	@GetMapping("/mypet/inquiry.do")
	public ResponseEntity<MypetVO> inquiry(HttpSession session, String petId) {
		MypetVO vo = new MypetVO();

		vo.setMypet_owner((String)session.getAttribute("loggedInUser"));
		vo.setMypet_id(Integer.parseInt(petId));

		// System.out.println(vo);

		return ResponseEntity.ok(service.inquiry(vo));
	}
}
