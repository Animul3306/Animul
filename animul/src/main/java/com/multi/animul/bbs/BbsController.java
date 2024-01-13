package com.multi.animul.bbs;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class BbsController {

	@Autowired
	BbsService service;
	
	@Autowired
	ReplyService replyservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	// 게시글 작성 + 첨부파일
	@RequestMapping("bbs/freeInsert")
	public String insert(BbsVO vo, @RequestParam(value="file", required=false) MultipartFile file )throws Exception {
		
		System.out.println(vo);
		System.out.println("file: "+file);
		
		

//		if(file != null) {
//			System.out.println("null 체크 됨");
//			String imgUploadPath = uploadPath + File.separator + "imgUpload";
//			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
//			String fileName = null;
//		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
//
//		vo.setBbs_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//		vo.setBbs_thumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
//		}
		
		int insertResult = service.insert(vo);
//		// 디버깅 로그 추가
//		System.out.println("No file uploaded. Using default values.");
//		System.out.println("Bbs_img Value: " + vo.getBbs_img());
//        System.out.println("Bbs_thumbImg Value: " + vo.getBbs_thumbImg());
		
		
		
		System.out.println(vo);
		if (insertResult > 0) {
			return "redirect:freeList";
		} else {
			return "freeInsert";
		}
	}

	// 자유 토크 게시판 목록
	@RequestMapping("bbs/freeList")
	public String list(
			BbsVO vo, 
			Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "word", required = false, defaultValue = "") String word,
			@RequestParam(value = "type", required = false, defaultValue = "") String type
			) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("word", word);
		map.put("type", type);
		List<BbsVO> list = service.pagingList(map);
		model.addAttribute("list", list);
		//페이징
		List<BbsVO> pagingList = service.pagingList(map);
		PageVO pageVO = service.pagingParam(map);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		model.addAttribute("word", word);
		model.addAttribute("type", type);
		
		//검색

		return "bbs/freeList";
	}
	
	// 자유 토크 게시판 목록
	@RequestMapping("bbs/freeListSearch")
	public String listSearch(
			BbsVO vo, 
			Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "word", required = false, defaultValue = "") String word,
			@RequestParam(value = "type", required = false, defaultValue = "") String type
			) {
		System.out.println("word: "+word+" / page: "+page);
		System.out.println(type);
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("word", word);
		map.put("type", type);
		List<BbsVO> list = service.pagingList(map);
		model.addAttribute("list", list);
		//페이징
		List<BbsVO> pagingList = service.pagingList(map);
		PageVO pageVO = service.pagingParam(map);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		model.addAttribute("word", word);
		model.addAttribute("type", type);
		return "bbs/freeListSearch";
	}

	// 산책 메이트 + 멍냥이 찾기 게시판 목록
	@RequestMapping("bbs/localList")
	public String list2(BbsVO vo, Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		List<BbsVO> list = service.pagingList2(page);
		model.addAttribute("list", list);
		//페이징
		List<BbsVO> pagingList = service.pagingList2(page);
		PageVO pageVO = service.pagingParam2(page);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		return "bbs/localList";

	}

	// 자유 토크 게시글 상세 페이지
	@RequestMapping("bbs/one")
	public String one(@RequestParam("bbs_id") int bbs_id, Model model) {
		service.hit(bbs_id);
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
        List<ReplyVO> replyList = replyservice.findAll(bbs_id);
        model.addAttribute("replyList", replyList);
		
		return "bbs/one";
	}
	
	// 산책 메이트 + 멍냥이 찾기 게시글 상세 페이지
	@RequestMapping("bbs/one2")
	public String one2(@RequestParam("bbs_id") int bbs_id, Model model) {
		service.hit(bbs_id);
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
		return "bbs/one2";
	}

	// 게시글 수정 페이지
	@RequestMapping(value = "bbs/freeUpdate", method = RequestMethod.GET)
	public String updateForm(@RequestParam("bbs_id") int bbs_id, Model model) {
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
		return "bbs/freeUpdate";
	}

	// 게시글 수정
	@RequestMapping(value = "bbs/freeupdate", method = RequestMethod.POST)
	public String update(@ModelAttribute BbsVO vo, Model model) {
		service.update(vo);
		BbsVO vo2 = service.one(vo.getBbs_id());
		model.addAttribute("vo2", vo2);
		return "redirect:freeList";
	}

	// 게시글 삭제
	@RequestMapping("bbs/delete")
	public String delete(@RequestParam("bbs_id") int bbs_id) {
		service.delete(bbs_id);
		return "redirect:freeList";
	}




	
}
