package com.multi.animul.diagnosis;


import java.text.SimpleDateFormat;
import org.apache.commons.lang3.StringUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReceiptService {
	
	@Autowired
	ReceiptDAO receiptDAO;
	
	@Autowired
	Receipt_itemDAO receipt_itemDAO;
	
	@Autowired
	DiagnosisDAO diagnosisDAO;
	
	@Transactional(rollbackFor = Exception.class)
	public int insert(ArrayList<ArrayList<String>> list) throws Exception {
		ReceiptVO receiptVO = new ReceiptVO();
		Receipt_itemVO bag2 = new Receipt_itemVO();
		int receiptResult = 0;
		int itemResult = 0;
		receiptVO.setReceipt_id(list.get(0).get(0));
		//나중에 세션으로 바꿔야하는거
		receiptVO.setReceipt_myid("qpzmal100");
		//이것도 검색해서 나오는걸로
		receiptVO.setReceipt_hospitalname(list.get(1).get(0));
		receiptVO.setReceipt_address(list.get(2).get(0));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(list.get(3).get(0));
		receiptVO.setReceipt_date(date);
		receiptVO.setReceipt_price(Integer.parseInt(list.get(6).get(0)));
		System.out.println(receiptVO.toString());
		
		for (int i = 0; i < list.get(4).size(); i++) {
			List<DiagnosisVO> list2 = diagnosisDAO.list();
			bag2.setReceipt_item_receiptid(list.get(0).get(0));
			double pre = 0.0;
			double similarity = 0.0;
			
			if(list.get(4).get(i).trim() == "" && bag2.getReceipt_item_diagnosisname() != "") {
			} else {
				bag2.setReceipt_item_diagnosisname("");
			}
			for (int j = 0; j < list2.size(); j++) {
				System.out.println(list.get(4).get(i));
				//유사도 체크
				similarity = findSimilarity(list.get(4).get(i), list2.get(j).getDiagnosis_name());
				if(pre <= similarity && similarity >= 0.5) {
					bag2.setReceipt_item_diagnosisname(list2.get(j).getDiagnosis_name());
					System.out.println(similarity);
					pre = similarity;
				}
			}
			bag2.setReceipt_item_price(Integer.parseInt(list.get(5).get(i)));
			System.out.println(bag2.toString());
			if(bag2.getReceipt_item_diagnosisname() != "" && !bag2.getReceipt_item_diagnosisname().isEmpty()) {
				if(receiptResult == 0) {
					receiptResult = receiptDAO.insert(receiptVO);
				}
				itemResult = receipt_itemDAO.insert(bag2);
			} else {
			    System.out.println("해당하는 진료명이 없음");
			}
		}
		
		return receiptResult;
	}
	
	public int review(ReceiptVO receiptVO) {
		return receiptDAO.review(receiptVO);
	}
	
	public ReceiptVO one(ReceiptVO receiptVO) {
		return receiptDAO.one(receiptVO);
	}
	
	public List<ReceiptVO> myList(ReceiptVO receiptVO){
		return receiptDAO.myList(receiptVO);
	}
	
	public List<ReceiptVO> list(){
		return receiptDAO.list();
	}
	
	public static double findSimilarity(String x, String y) {
        if (x == null && y == null) {
            return 1.0;
        }
        if (x == null || y == null) {
            return 0.0;
        }
        return StringUtils.getJaroWinklerDistance(x, y);
    }
	
}
