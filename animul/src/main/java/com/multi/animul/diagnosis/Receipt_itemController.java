package com.multi.animul.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Receipt_itemController {

	@Autowired
	Receipt_itemService receipt_itemService;
	
	@RequestMapping("diagnosis/receiptItemInsert")
	public void insert(Receipt_itemVO receipt_itemVO, Model model) {
		int itemResult = receipt_itemService.insert(receipt_itemVO);
		model.addAttribute("itemResult", itemResult);
	}
	
	@RequestMapping("diagnosis/receiptItemOne")
	public void one(Receipt_itemVO receipt_itemVO, Model model) {
		Receipt_itemVO itemVO = receipt_itemService.one(receipt_itemVO);
		model.addAttribute("itemVO", itemVO);
	}
	
	@RequestMapping("diagnosis/receiptItemList")
	public void list(Model model) {
		List<Receipt_itemVO> itemList = receipt_itemService.list();
		model.addAttribute("itemList", itemList);
	}
}
