package com.multi.animul.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BbsController {

	@Autowired
	BbsService service;
	
	// �Խñ� �ۼ�
	@RequestMapping("bbs/insert")
	public String insert(BbsVO vo) {
		int insertResult = service.insert(vo);
		if (insertResult > 0) {
			return "redirect:free";
		} else {
			return "insert";
		}
	}
	
	// ���� ��ũ �Խ��� ���
	@RequestMapping("bbs/free")
	public String list(BbsVO vo, Model model) {
		List<BbsVO> list = service.list();
		model.addAttribute("list", list);
		return "bbs/free";
	}
	
	// ��å ����Ʈ + �۳��� ã�� �Խ��� ���
	@RequestMapping("bbs/local")
	public String list2(BbsVO vo, Model model) {
		List<BbsVO> list = service.list2();
		model.addAttribute("list",list);
		return "bbs/local";
		
	}
	
	// �Խñ� �� ������
	@RequestMapping("bbs/one")
	public String one(@RequestParam("bbs_id") int bbs_id, Model model) {
		service.hit(bbs_id);
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
		return "bbs/one";
	}

	// �Խñ� ���� ������
	@RequestMapping(value = "bbs/update", method = RequestMethod.GET)
	public String updateForm(@RequestParam("bbs_id") int bbs_id, Model model) {
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
		return "bbs/update";
	}

	// �Խñ� ����
	@RequestMapping(value = "bbs/update", method = RequestMethod.POST)
	public String update(@ModelAttribute BbsVO vo, Model model) {
		service.update(vo);
		BbsVO vo2 = service.one(vo.getBbs_id());
		model.addAttribute("vo2", vo2);
		return "redirect:free";
	}
	
	// �Խñ� ����
	@RequestMapping("bbs/delete")
	public String delete(@RequestParam("bbs_id") int bbs_id) {
		service.delete(bbs_id);
		return "redirect:free";
	}

}
