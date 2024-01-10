package com.multi.animul.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyService service;
	
	
	@RequestMapping(value = "/comment/save", method = RequestMethod.POST)
	public @ResponseBody List<ReplyVO> save(@ModelAttribute ReplyVO replyVO) {
        System.out.println("ReplyVO = " + replyVO);
        service.save(replyVO);
        // 해당 게시글에 작성된 댓글 리스트를 가져옴
        List<ReplyVO> replyList = service.findAll(replyVO.getBbs_id());
        return replyList;
	}
	
	@RequestMapping("/comment/delete")
	public void delete(@RequestParam("reply_id") int reply_id) {
		service.delete(reply_id);
	}
}
