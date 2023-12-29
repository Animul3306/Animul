package com.multi.animul.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReceiptController {
	
	@Autowired
	ReceiptService receiptService;
	
	@RequestMapping("diagonosis/receiptInsert")
	public void  insert(ReceiptVO receiptVO, Model model) {
		 int insertResult = receiptService.insert(receiptVO);
		 model.addAttribute("insertResult", insertResult);
	}
	
	@RequestMapping("diagonosis/reviewInsert")
	public void review(ReceiptVO receiptVO, Model model) {
		 int reviewResult = receiptService.review(receiptVO);
		 model.addAttribute("reviewResult", reviewResult);
	}
	
	@RequestMapping("diagonosis/receiptOne")
	public void one(ReceiptVO receiptVO, Model model) {
		 ReceiptVO receiptBag = receiptService.one(receiptVO);
		 model.addAttribute("receiptBag", receiptBag);
	}
	
	@RequestMapping("diagonosis/receiptList")
	public void list(Model model){
		 List<ReceiptVO> receiptResult = receiptService.list(); 
		 model.addAttribute("receiptResult", receiptResult);
	}
}
