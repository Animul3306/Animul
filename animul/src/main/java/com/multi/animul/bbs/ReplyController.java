package com.multi.animul.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyService service;
	
	@RequestMapping("/comment/list/{bbs_id}")
	public @ResponseBody List<ReplyVO> replyList(@PathVariable int bbs_id) {
		List<ReplyVO> replylist = service.findAll(bbs_id);
        return replylist;
	}
	
	
	@RequestMapping(value = "/comment/save", method = RequestMethod.POST)
	public @ResponseBody List<ReplyVO> save(@ModelAttribute ReplyVO replyVO) {
        System.out.println("ReplyVO = " + replyVO);
        service.save(replyVO);
        // 해당 게시글에 작성된 댓글 리스트를 가져옴
        List<ReplyVO> replyList = service.findAll(replyVO.getBbs_id());
        return replyList;
	}
	
	@RequestMapping("/comment/delete/{reply_id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable int reply_id) {
		System.out.println(reply_id);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ReplyVO vo = new ReplyVO();
			vo.setReply_id(reply_id);
			service.delete(vo);
			map.put("result","success");
		} catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		System.out.println("map : " + map.size());
		return map;
	}
	
	@RequestMapping("/comment/update/{reply_id}/{reply_content")
	@ResponseBody
	public Map<String, Object> update(@PathVariable int reply_id, @PathVariable String reply_content) {
		System.out.println(reply_id);
		System.out.println(reply_content);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ReplyVO vo = new ReplyVO();
			vo.setReply_id(reply_id);
			vo.setReply_content(reply_content);

			map.put("result","success");
			
		} catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		System.out.println("map : " + map.size());
		return map;
	}

}

