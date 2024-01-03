package com.multi.animul.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.animul.bbs.BbsVO;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(NoticeVO vo) {
		int result =my.insert("notice.insert", vo);
		return result;
	}
	
	public int delete(NoticeVO vo) {
		int result = my.delete("notice.delete", vo);
		return result;
		}
	
	public int update(NoticeVO vo) {
		int result = my.update("notice.update", vo);
		return result;
		}
	
	public List<NoticeVO> list() {
		List<NoticeVO> list = my.selectList("notice.list");
		return list;
	}
	
	public BbsVO one(NoticeVO vo) {
		BbsVO vo2 = my.selectOne("notice.one", vo);
		return vo2;
	}
	
	
}
