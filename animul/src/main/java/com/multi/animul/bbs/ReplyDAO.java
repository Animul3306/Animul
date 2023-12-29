package com.multi.animul.bbs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate my;
}
