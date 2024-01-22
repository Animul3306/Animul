package com.multi.animul.diagnosis;


import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.xdevapi.JsonArray;

@Controller
public class Receipt_itemController {

	@Autowired
	Receipt_itemService receipt_itemService;
	
	@RequestMapping("diagnosis/receiptItemInsert")
	public void insert(Receipt_itemVO receipt_itemVO, Model model) {
		int itemResult = receipt_itemService.insert(receipt_itemVO);
		model.addAttribute("itemResult", itemResult);
	}
	
	@RequestMapping(value = "diagnosis/receiptItemOne", method=RequestMethod.POST)
	public void one(Receipt_itemVO receipt_itemVO, Model model) {
		Receipt_itemVO itemVO = receipt_itemService.one(receipt_itemVO);
		model.addAttribute("itemVO", itemVO);
	}
	
	@RequestMapping(value = "diagnosis/receiptItemList", method=RequestMethod.POST)
	public void itemList(Receipt_itemVO receipt_itemVO, Model model) {
		List<Receipt_itemVO> itemList = receipt_itemService.itemList(receipt_itemVO);
		model.addAttribute("itemList", itemList);
	}
	
	@ResponseBody
    @RequestMapping("diagnosis/totalPrice")
	public ReceiptTotalVO totalPrice(ReceiptTotalVO receiptTotalVO, Model model) {
		System.out.println(receiptTotalVO);
		if(receiptTotalVO.getGugunAddress() == "") {
			receiptTotalVO.setGugunAddress(null);
		}
		ReceiptTotalVO receiptTotal = receipt_itemService.totalPrice(receiptTotalVO);
		model.addAttribute("receiptTotal", receiptTotal);
		  
		return receiptTotal;
	}
	
	@ResponseBody
	@RequestMapping("diagnosis/avgPrice")
	public List<ReceiptTotalVO> avgPrice(Model model) {
		List<ReceiptTotalVO> avgPriceList = receipt_itemService.avgPrice();
		model.addAttribute("avgPriceList", avgPriceList);
		return avgPriceList;
	}
}
