package com.multi.animul.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SearchCenterService {

	@Autowired
	SearchCenterDAO dao;
 
	public int count(PageVO vo) {
		return dao.count(vo);
	}

	public int countAddress(PageVO vo) {
		return dao.countAddress(vo);
	}

	public int countKeyword(PageVO vo) {
		return dao.countKeyword(vo);
	}
	
	public void list11(PageVO vo) {
		System.out.println("2");
		dao.list1(vo);
		
	}
	
	public List<SearchCenterVO> list1(PageVO vo) {
		List<SearchCenterVO> list1 = dao.list1(vo);
		return list1;
	}
	
	public List<SearchCenterVO> list2(PageVO vo) {
		List<SearchCenterVO> list2 = dao.list2(vo);
		return list2;
	}
	
	public List<SearchCenterVO> list3(PageVO vo) {
		List<SearchCenterVO> list3 = dao.list3(vo);
		return list3;
	}
}
