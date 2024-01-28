package com.multi.animul.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ReceiptController {
	
	@Autowired
	ReceiptService receiptService;
	
	@Autowired
	Receipt_itemService receipt_itemService;
	
	@RequestMapping("diagnosis/receiptUp")
	public String receiptUp(ReceiptVO receiptVO) {
		 int result = receiptService.receiptUp(receiptVO);
		 if(result == 1) {
			 return "redirect:receiptList";
		 }
		 return "";
	}
	
	@ResponseBody
	@RequestMapping("diagnosis/receiptDel")
	public int receiptDel(ReceiptVO receiptVO) {
		 int result = receiptService.receiptDel(receiptVO);
		 return result;
	}
	
	@RequestMapping("diagnosis/receiptOne")
	public void one(ReceiptVO receiptVO, Model model) {
		 ReceiptVO receiptBag = receiptService.one(receiptVO);
		 model.addAttribute("receiptBag", receiptBag);
	}
	
	@RequestMapping("diagnosis/receiptMyList")
	public void myList(ReceiptVO receiptVO, Model model){
		 List<ReceiptVO> receiptMyResult = receiptService.myList(receiptVO); 
		 List<Receipt_itemVO> diagnosisMyResult = receipt_itemService.diagnosisMyList(receiptVO);
		 System.out.println(receiptMyResult);
		 model.addAttribute("receiptMyResult", receiptMyResult);
		 model.addAttribute("diagnosisMyResult", diagnosisMyResult);
	}
	
	@RequestMapping("diagnosis/receiptList")
	public void list(Model model){
		 List<ReceiptVO> receiptResult = receiptService.list(); 
		 List<Receipt_itemVO> diagnosisResult = receipt_itemService.diagnosisList();
		 System.out.println(diagnosisResult);
		 model.addAttribute("receiptResult", receiptResult);
		 model.addAttribute("diagnosisResult", diagnosisResult);
	}
	
	@RequestMapping("diagnosis/clovaOCR")
	public void clovaOcr(HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		//파일첨부한 경우에는 file이름 텍스트 + 이미지파일자체 
		
		//1. 파일의 이름 + 파일 저장 위치를 알아와야한다. ==> String
		String savedName = file.getOriginalFilename();
		System.out.println(savedName);
		
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload2");
		System.out.println(uploadPath + "/" + savedName);
		
		//2. 파일객체를 생성 ==> 파일을 인식(램에 저장)
		File target = new File(uploadPath + "/" + savedName);
		
		//3. 서버 컴퓨터에 파일을 저장 시켜야한다. ==> resources 아래에 저장!
		file.transferTo(target);
		
		ClovaOcr ocr2 = new ClovaOcr();
		String fileName = uploadPath + "/" + savedName;
		ArrayList<ArrayList<String>> list = ocr2.ocr(fileName);
		System.out.println("너의 UID" + list.get(0).get(0));
		File renamedFile = new File(uploadPath + "/" + list.get(0).get(0) + ".png");
		
		if (target.renameTo(renamedFile)) {
	        System.out.println("File renamed successfully to: " + list.get(0).get(0));
	    } else {
	        System.out.println("Failed to rename the file.");
	    }
		
		System.out.println(list.get(1).get(0));
		
		model.addAttribute("uid",list.get(0).get(0));
		model.addAttribute("hospital",list.get(1).get(0));
		model.addAttribute("address",list.get(2).get(0));
		
		int insertResult = receiptService.insert(list);
		
		//리턴값
		model.addAttribute("insertResult", insertResult);
	}
}