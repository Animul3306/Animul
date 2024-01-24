package com.multi.animul.map;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchCenterDAO {

	@Autowired
	SqlSessionTemplate my;

	public void list11(PageVO pageVO) {
		System.out.println("3");
		List<Object> list1 = my.selectList("searchcenter.list1",pageVO);
		System.out.println("object list: " + list1.toString());
	}

	public List<SearchCenterVO> list1(PageVO pageVO) {
		return my.selectList("searchcenter.list1",pageVO);
	}
	
	public List<SearchCenterVO> list2(PageVO pageVO) {
		return my.selectList("searchcenter.list2",pageVO); //("namepace.id", vo)		
	}
	
	public List<SearchCenterVO> list3(PageVO pageVO) {
		return my.selectList("searchcenter.list3",pageVO);
		
	}
	
	public int count(PageVO vo) {		
		return my.selectOne("searchcenter.count", vo);
	}
	
	public int countAddress(PageVO vo) {		
		return my.selectOne("searchcenter.countAddress", vo);
	}
	
	public int countKeyword(PageVO vo) {		
		return my.selectOne("searchcenter.countKeyword", vo);
	}
	
	public SearchCenterVO one(SearchCenterVO vo) {
		SearchCenterVO searchcenterVO = my.selectOne("searchcenter.one",vo);
		
		return searchcenterVO;
	}
}
