package com.multi.animul.retrieve;

	import java.util.List;

	import org.mybatis.spring.SqlSessionTemplate;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;

	@Repository
	public class RetrieveDAO {
		@Autowired
		SqlSessionTemplate my;
		
		public void insert(RetrieveVO vo) {
			my.insert("retrieve.insert", vo);
		}
		
		public List<RetrieveVO> all() {
			return my.selectList("");
		}
		
		public int delete(RetrieveVO vo) {
			return my.delete("retrieve.delete", vo);
		}
		
		public int count() {
			return my.selectOne("");
		}
}
