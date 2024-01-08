package com.multi.animul.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate my;

	public void save(ReplyVO replyVO) {
        my.insert("reply.save", replyVO);
    }

    public List<ReplyVO> findAll(int bbs_id) {
        return my.selectList("reply.findAll", bbs_id);
    }
	
	
}
