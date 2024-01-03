package com.multi.animul.diagnosis;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiagnosisDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(DiagnosisVO diagnosisVO) {
		return my.insert("dianosis.insert", diagnosisVO);
	}
	
	public DiagnosisVO one(DiagnosisVO diagnosisVO) {
		return my.selectOne("diagnosis.one", diagnosisVO);
	}
	
	public List<DiagnosisVO> list() {
		return my.selectList("diagnosis.list");
	}
	
	public List<DiagnosisVO> find(DiagnosisVO diagnosisVO) {
		return my.selectList("diagnosis.find", diagnosisVO);
	}
}
