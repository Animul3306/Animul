package com.multi.animul.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO dao;
	
	public int insert(NoticeVO vo) {
		return dao.insert(vo);
	}
	
	public List<NoticeVO> list() {
		return dao.list();
	}
	
	public List<NoticeVO> list1() {
		return dao.list1();
	}
	
	public List<NoticeVO> list2(PageVO pageVO){
		return dao.list2(pageVO);
	}
	
	public int count() {
		return dao.count();
	}
	
	
	public NoticeVO one(NoticeVO vo) {
		return dao.one(vo);
	}
	
	public int update(NoticeVO vo) {
		return dao.update(vo);
	}
	
	public int delete(NoticeVO vo) {
		return dao.delete(vo);
	}
	
	public List<NoticeVO> newNotice() {
		return dao.newNotice();
	}
	
}
