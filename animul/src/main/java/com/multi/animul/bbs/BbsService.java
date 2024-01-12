package com.multi.animul.bbs;

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

	public List<BbsVO> list() {
		return dao.list();
	}

	public BbsVO one(int bbs_id) {
		return dao.one(bbs_id);
	}

	public void hit(int bbs_id) {
		dao.hit(bbs_id);

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
	
	
	
	int pageLimit = 10; // �� ������ �� ������ �� ����
	int blockLimit = 5; // �ϴܿ� ������ ������ ��ȣ ����
	public List<BbsVO> pagingList(int page) {
		
		int pagingStart = (page - 1) * pageLimit;
		Map<String, Integer> pagingParams = new HashMap<>();
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);
		List<BbsVO> pagingList = dao.pagingList(pagingParams);
		return pagingList;
	}

	public PageVO pagingParam(int page) {
		//��ü �� ���� ��ȸ
		int bbsCount = dao.bbsCount();
		// ��ü ������ ���� ���
		int maxPage = (int)(Math.ceil((double)bbsCount/pageLimit));
		// ���� ������ �� ���
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

		return pageVO;
	}
	
	public List<BbsVO> pagingList2(int page) {
		
		int pagingStart = (page - 1) * pageLimit;
		Map<String, Integer> pagingParams = new HashMap<>();
		pagingParams.put("start", pagingStart);
		pagingParams.put("limit", pageLimit);
		List<BbsVO> pagingList = dao.pagingList2(pagingParams);
		return pagingList;
	}

	public PageVO pagingParam2(int page) {
		//��ü �� ���� ��ȸ
		int bbsCount = dao.bbsCount2();
		// ��ü ������ ���� ���
		int maxPage = (int)(Math.ceil((double)bbsCount/pageLimit));
		// ���� ������ �� ���
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

		return pageVO;
	}
	
	
	public List<BbsVO> listSearch(int pageStart, int postNum, String Type, String keyword) {
		return dao.search(pageStart, postNum, Type, keyword);
	}

}
