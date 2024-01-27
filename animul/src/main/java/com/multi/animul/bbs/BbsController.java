package com.multi.animul.bbs;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.multi.animul.cs.NoticeService;
import com.multi.animul.cs.NoticeVO;

@Controller
public class BbsController {

	@Autowired
	BbsService service;

	@Autowired
	ReplyService replyservice;
	
	@Autowired
	NoticeService noticeservice;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	//자유게시판 작성
	@RequestMapping("bbs/freeInsert")
	public String insert(BbsVO vo, @RequestParam(value = "file", required = false) MultipartFile file,
			HttpSession session, Model model) throws Exception {

		String loggedInUser = (String) session.getAttribute("loggedInUser");
		vo.setMember_id(loggedInUser);

		System.out.println(loggedInUser);
		System.out.println("member_id = " + vo.getMember_id());
		model.addAttribute("vo", vo);

		System.out.println(vo);
		System.out.println(file);

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setBbs_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setBbs_thumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			//첨부파일 첨부안할 시
			vo.setBbs_img("/resources/img/imgUpload/none.png");
			vo.setBbs_thumbImg("/resources/img/imgUpload/none.png");
		}

		int insertResult = service.insert(vo);

		
		System.out.println("No file uploaded. Using default values.");
		System.out.println("Bbs_img Value: " + vo.getBbs_img());
		System.out.println("Bbs_thumbImg Value: " + vo.getBbs_thumbImg());

		System.out.println(vo);
		if (insertResult > 0) {
			return "redirect:freeList";
		} else {
			return "insert";
		}
	}

	//산책 메이트+멍냥이 찾기 게시판 작성
	@RequestMapping("bbs/localInsert")
	public String insert2(BbsVO vo, @RequestParam(value = "file", required = false) MultipartFile file,
			HttpSession session, Model model) throws Exception {

		String loggedInUser = (String) session.getAttribute("loggedInUser");
		vo.setMember_id(loggedInUser);

		System.out.println(loggedInUser);
		System.out.println("member_id = " + vo.getMember_id());
		model.addAttribute("vo", vo);

		System.out.println(vo);
		System.out.println(file);

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setBbs_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setBbs_thumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			
			vo.setBbs_img("/resources/img/imgUpload/none.png");
			vo.setBbs_thumbImg("/resources/img/imgUpload/none.png");
		}

		int insertResult = service.insert2(vo);

	
		System.out.println("No file uploaded. Using default values.");
		System.out.println("Bbs_img Value: " + vo.getBbs_img());
		System.out.println("Bbs_thumbImg Value: " + vo.getBbs_thumbImg());

		System.out.println(vo);
		if (insertResult > 0) {
			return "redirect:localList";
		} else {
			return "insert2";
		}
	}

	//자유게시판 리스트
	@RequestMapping("bbs/freeList")
	public String list(BbsVO vo, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "word", required = false, defaultValue = "") String word,
			@RequestParam(value = "type", required = false, defaultValue = "") String type, HttpSession session) {

		String loggedInUser = (String) session.getAttribute("loggedInUser");
		vo.setMember_id(loggedInUser);
		model.addAttribute(vo);
		
		//페이징 + 검색
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("word", word);
		map.put("type", type);
		List<BbsVO> list = service.pagingList(map);
		model.addAttribute("list", list);
		
		List<BbsVO> pagingList = service.pagingList(map);
		PageVO pageVO = service.pagingParam(map);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		model.addAttribute("word", word);
		model.addAttribute("type", type);

		return "bbs/freeList";
	}

	// 자유게시판 검색
	@RequestMapping("bbs/freeListSearch")
	public String listSearch(BbsVO vo, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "word", required = false, defaultValue = "") String word,
			@RequestParam(value = "type", required = false, defaultValue = "") String type) {

		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("word", word);
		map.put("type", type);
		List<BbsVO> list = service.pagingList(map);
		model.addAttribute("list", list);
		
		List<BbsVO> pagingList = service.pagingList(map);
		PageVO pageVO = service.pagingParam(map);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		model.addAttribute("word", word);
		model.addAttribute("type", type);
		return "bbs/freeListSearch";
	}

	//산책 메이트+멍냥이 찾기 게시판 리스트
	@RequestMapping("bbs/localList")
	public String list2(BbsVO vo, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "word", required = false, defaultValue = "") String word,
			@RequestParam(value = "type", required = false, defaultValue = "") String type) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("word", word);
		map.put("type", type);
		List<BbsVO> list = service.pagingList2(map);
		model.addAttribute("list", list);
		
		List<BbsVO> pagingList = service.pagingList2(map);
		PageVO pageVO = service.pagingParam2(map);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		model.addAttribute("word", word);
		model.addAttribute("type", type);


		return "bbs/localList";
	}

	//산책 메이트+멍냥이 찾기 게시판 검색
	@RequestMapping("bbs/localListSearch")
	public String listSearch2(BbsVO vo, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "word", required = false, defaultValue = "") String word,
			@RequestParam(value = "type", required = false, defaultValue = "") String type) {

		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("word", word);
		map.put("type", type);
		List<BbsVO> list = service.pagingList2(map);
		model.addAttribute("list", list);
		
		List<BbsVO> pagingList = service.pagingList2(map);
		PageVO pageVO = service.pagingParam2(map);
		model.addAttribute("freeList", pagingList);
		model.addAttribute("paging", pageVO);
		model.addAttribute("word", word);
		model.addAttribute("type", type);
		return "bbs/freeListSearch";
	}

	//자유게시판 상세 게시물
	@RequestMapping("bbs/one")
	public String one(@RequestParam("bbs_id") int bbs_id, Model model) {
		service.hit(bbs_id);
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
		List<ReplyVO> replyList = replyservice.findAll(bbs_id);
		model.addAttribute("replyList", replyList);
		service.updateReplyCnt(bbs_id);
		return "bbs/one";
	}

	//산책 메이트+멍냥이 찾기 게시판 상세 게시물
	@RequestMapping("bbs/one2")
	public String one2(@RequestParam("bbs_id") int bbs_id, Model model) {
		service.hit(bbs_id);
		BbsVO vo = service.one(bbs_id);
		model.addAttribute("vo", vo);
		List<ReplyVO> replyList = replyservice.findAll(bbs_id);
		model.addAttribute("replyList", replyList);
		service.updateReplyCnt(bbs_id);
		return "bbs/one2";
	}

	//자유게시판 게시물 수정
	@RequestMapping(value = "bbs/freeUpdate", method = RequestMethod.GET)
	public String updateForm(@RequestParam("bbs_id") int bbs_id, @ModelAttribute BbsVO vo, Model model,
			MultipartFile file, HttpServletRequest req) {
		vo = service.one(bbs_id);
		vo.setBbs_img(req.getParameter("bbs_img"));
		vo.setBbs_thumbImg(req.getParameter("bbs_thumbImg"));
		model.addAttribute("vo", vo);
		return "bbs/freeUpdate";
	}
	
	//산책 메이트+멍냥이 찾기 게시물 수정
	@RequestMapping(value = "bbs/localUpdate", method = RequestMethod.GET)
	public String updateForm2(@RequestParam("bbs_id") int bbs_id, Model model) {

		BbsVO vo = service.one(bbs_id);

		model.addAttribute("vo", vo);
		return "bbs/localUpdate";
	}

	//산책 메이트+멍냥이 찾기 게시물 수정
	@RequestMapping(value = "bbs/freeupdate", method = RequestMethod.POST)
	public String update(@ModelAttribute BbsVO vo, Model model, MultipartFile file, HttpServletRequest req)
			throws IOException, Exception {

		// 새로운 파일 첨부 시
		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			// 기존 파일 삭제
			new File(uploadPath + req.getParameter("bbs_img")).delete();
			new File(uploadPath + req.getParameter("bbs_thumbImg")).delete();

			
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setBbs_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setBbs_thumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일 첨부 안할 시
			// 기존 파일 가져오기
			vo.setBbs_img(req.getParameter("bbs_img"));
			vo.setBbs_thumbImg(req.getParameter("bbs_thumbImg"));

		}
		service.update(vo);
		BbsVO vo2 = service.one(vo.getBbs_id());
		model.addAttribute("vo2", vo2);
		return "redirect:freeList";
	}
	//자유게시판 게시물 수정
	@RequestMapping(value = "bbs/localUpdate", method = RequestMethod.POST)
	public String update2(@ModelAttribute BbsVO vo, Model model, MultipartFile file, HttpServletRequest req)
			throws IOException, Exception {

		// 새로운 파일 첨부 시
		if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			// 기존 파일 삭제
			new File(uploadPath + req.getParameter("bbs_img")).delete();
			new File(uploadPath + req.getParameter("bbs_thumbImg")).delete();

			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setBbs_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setBbs_thumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일 첨부 안할 시
			// 기존 파일 가져오기
			vo.setBbs_img(req.getParameter("bbs_img"));
			vo.setBbs_thumbImg(req.getParameter("bbs_thumbImg"));

		}
		service.update(vo);
		BbsVO vo2 = service.one(vo.getBbs_id());
		model.addAttribute("vo2", vo2);
		return "redirect:localList";
	}

	// 자유게시판 게시물 삭제
	@RequestMapping("bbs/delete")
	public String delete(@RequestParam("bbs_id") int bbs_id) {
		service.delete(bbs_id);
		return "redirect:freeList";
	}
	
	// 산책메이트 + 멍냥이 찾기 게시물 삭제
	@RequestMapping("bbs/delete2")
	public String delete2(@RequestParam("bbs_id") int bbs_id) {
		service.delete(bbs_id);
		return "redirect:localList";
	}

	// 보호중 게시판 리스트
	@RequestMapping("bbs/protectList")
	public String protectList(@RequestParam(value = "page", required = false, defaultValue = "1") String page,
			@RequestParam(value = "upr_cd", defaultValue = "6110000") String upr_cd, Model model) {
		System.out.println("ListSerch");
		System.out.println(upr_cd);
		ApiExplorerProtect protectAPI = new ApiExplorerProtect();
		ArrayList<ProtectVO> list = protectAPI.protectAPI(page, upr_cd);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("upr_cd", upr_cd);

		return "bbs/protectList";
	}

	// 보호중 게시판 상세 게시물
	@RequestMapping("bbs/protectOne")
	public String one3(@RequestParam("desertionNo") String desertionNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") String page,
			@RequestParam(value = "upr_cd", defaultValue = "6110000") String upr_cd, Model model) {

		ApiExplorerProtect protectAPI = new ApiExplorerProtect();
		ArrayList<ProtectVO> list = protectAPI.protectAPI(page, upr_cd);
		model.addAttribute("upr_cd", upr_cd);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		System.out.println("upr_cd = " + upr_cd);
		System.out.println("page = " + page);

		System.out.println("list = " + list);
		for (ProtectVO vo : list) {
			if (vo.getDesertionNo().equals(desertionNo)) {
				System.out.println("vo = " + vo);
				System.out.println("upr_cd = " + upr_cd);
				model.addAttribute("vo", vo);
				model.addAttribute("upr_cd", upr_cd);

			}
		}

		return "bbs/protectOne";
	}
	
	// 메인페이지 인기글, 공지사항
		@RequestMapping("/main")
		public String bestList(Model model) {
			List<BbsVO> bestList =  service.bestList();
			model.addAttribute("bestList", bestList);
			System.out.println(bestList);
			
			List<NoticeVO> newNotice =noticeservice.newNotice();
			model.addAttribute("newNotice", newNotice);
			return "main";
		}

}
