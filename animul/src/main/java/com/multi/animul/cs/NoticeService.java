package com.multi.animul.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO dao;
	
	public int insert(NoticeVO vo) {
		 return dao.insert(vo);
	}
}
