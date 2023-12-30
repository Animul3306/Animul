package com.multi.animul.cs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(NoticeVO vo) {
		int result =my.insert("notice.insert", vo);
		return result;
	}
	
}
