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
	
	public List<NoticeVO> list1() {
		List<NoticeVO> list1 = my.selectList("notice.list1");
		return list1;
	}
	
	public List<NoticeVO> list2(PageVO pageVO) {
		List<NoticeVO> list2 =	my.selectList("notice.list2", pageVO);
		return list2;
	}
	
	public int count() {
		return my.selectOne("notice.count");
	}
	
	
	
	public NoticeVO one(NoticeVO vo) {
		NoticeVO vo2 = my.selectOne("notice.one", vo);
		return vo2;
	}
	
	public List<NoticeVO> newNotice() {
		List<NoticeVO> list = my.selectList("notice.newNotice");
		return list;
	}
	
}
