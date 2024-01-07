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
	@RequestMapping("bbs/freeInsert")
	public String insert(BbsVO vo) {
		int insertResult = service.insert(vo);
		if (insertResult > 0) {
			return "redirect:freeList";
		} else {
			return "freeInsert";
		}
	}

	// ���� ��ũ �Խ��� ���
	@RequestMapping("bbs/freeList")
	public String list(BbsVO vo, Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		List<BbsVO> list = service.pagingList(page);
		model.addAttribute("list", list);
		//����¡
		List<BbsVO> pagingList = service.pagingList(page);
		PageVO pageVO = service.pagingParam(page);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		return "bbs/freeList";
	}

	// ��å ����Ʈ + �۳��� ã�� �Խ��� ���
	@RequestMapping("bbs/localList")
	public String list2(BbsVO vo, Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		List<BbsVO> list = service.pagingList2(page);
		model.addAttribute("list", list);
		//����¡
		List<BbsVO> pagingList = service.pagingList2(page);
		PageVO pageVO = service.pagingParam2(page);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		return "bbs/localList";

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
	@RequestMapping(value = "bbs/freeUpdate", method = RequestMethod.GET)
	public String updateForm(@RequestParam("bbs_id") int bbs_id, Model model) {
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
		return "bbs/freeUpdate";
	}

	// �Խñ� ����
	@RequestMapping(value = "bbs/update", method = RequestMethod.POST)
	public String update(@ModelAttribute BbsVO vo, Model model) {
		service.update(vo);
		BbsVO vo2 = service.one(vo.getBbs_id());
		model.addAttribute("vo2", vo2);
		return "redirect:freeList";
	}

	// �Խñ� ����
	@RequestMapping("bbs/delete")
	public String delete(@RequestParam("bbs_id") int bbs_id) {
		service.delete(bbs_id);
		return "redirect:freeList";
	}

	// ����¡ 

	
}
