package com.multi.animul.bbs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsService {

	@Autowired
	BbsDAO dao;

	public int insert(BbsVO vo) {
		return dao.insert(vo);
	}
	public int insert2(BbsVO vo) {
		return dao.insert2(vo);
	}


	public List<BbsVO> list() {
		return dao.list();
	}

	public BbsVO one(int bbs_id) {
		return dao.one(bbs_id);
	}

	public void hit(int bbs_id) {
		dao.hit(bbs_id);
	}
	
	public void updateReplyCnt(int bbs_id) {
		dao.updateReplyCnt(bbs_id);
	}

	public int update(BbsVO vo) {
		return dao.update(vo);
	}

	public void delete(int bbs_id) {
		dao.delete(bbs_id);

	}

	public List<BbsVO> list2() {
		return dao.list2();
	}
	
	public List<BbsVO> bestList() {
		return dao.bestList();
	}
	
	
	
	
	int pageLimit = 10; // 한 페이지 당 보여줄 글 갯수
	int blockLimit = 5; // 하단에 보여줄 페이지 번호 갯수
	public List<BbsVO> pagingList(Map<String, Object> map) {
		int page = (int) map.get("page");
		int pagingStart = (page - 1) * pageLimit;
		Map<String, Object> pagingParams = new HashMap<>();
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);
		pagingParams.put("word", map.get("word"));
		pagingParams.put("type", map.get("type"));
		List<BbsVO> pagingList = dao.pagingList(pagingParams);
		return pagingList;
	}

	public PageVO pagingParam(Map<String, Object> map) {
		int page = (int) map.get("page");
		//전체 글 갯수 조회
		int bbsCount = dao.bbsCount(map);
		// 전체 페이지 갯수 계산
		int maxPage = (int)(Math.ceil((double)bbsCount/pageLimit));
		// 시작 페이지 값 계산
		int startPage = (((int)(Math.ceil((double)page/blockLimit))) - 1) * blockLimit + 1;
		int endPage = startPage + blockLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		PageVO pageVO = new PageVO();
		pageVO.setPage(page);
		pageVO.setMaxPage(maxPage);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setTotalCount(bbsCount);
		pageVO.setPageLimit(pageLimit);

		return pageVO;
	}
	
	public List<BbsVO> pagingList2(Map<String, Object> map) {
		int page = (int) map.get("page");
		int pagingStart = (page - 1) * pageLimit;
		Map<String, Object> pagingParams = new HashMap<>();
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);
		pagingParams.put("word", map.get("word"));
		pagingParams.put("type", map.get("type"));
		List<BbsVO> pagingList = dao.pagingList2(pagingParams);
		return pagingList;
	}


	
	public PageVO pagingParam2(Map<String, Object> map) {
		int page = (int) map.get("page");
		//전체 글 갯수 조회
		int bbsCount = dao.bbsCount2(map);
		// 전체 페이지 갯수 계산
		int maxPage = (int)(Math.ceil((double)bbsCount/pageLimit));
		// 시작 페이지 값 계산
		int startPage = (((int)(Math.ceil((double)page/blockLimit))) - 1) * blockLimit + 1;
		int endPage = startPage + blockLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		PageVO pageVO = new PageVO();
		pageVO.setPage(page);
		pageVO.setMaxPage(maxPage);
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setTotalCount(bbsCount);
		pageVO.setPageLimit(pageLimit);


		return pageVO;
	}
	
	
	
	
	
	
	
	



}
