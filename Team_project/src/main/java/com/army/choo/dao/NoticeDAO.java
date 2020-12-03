package com.army.choo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.choo.dto.NoticeDTO;
import com.army.choo.dto.PageDTO;
import com.army.choo.dto.ProductDTO;


@Repository
public class NoticeDAO {

	
	@Autowired
	public SqlSessionTemplate sql;
	
	//시작 행과 끝 행을 가지고 공지사항 갯수 가져오기
	public List<PageDTO> noticeListpaging(PageDTO pdto) {
		return sql.selectList("Notice.noticelist",pdto);
	}

	//관리자가 쓴 공지사항 갯수
	public int listcount() {
		return sql.selectOne("Notice.noticecount");
	}

	//공지사항 작성
	public int noticeWrite(NoticeDTO ndto) {
		return sql.insert("Notice.noticewrite", ndto);
	}

	//공지사항 삭제
	public int noticeDelete(int nnumber) {
		return sql.delete("Notice.noticedelete", nnumber);
	}

	//공지사항 조회수 증가
	public void noticeHits(int nnumber) {
		sql.update("Notice.noticehits", nnumber);
	}
	
	//공지사항 상세보기
	public NoticeDTO noticeView(int nnumber) {
		return sql.selectOne("Notice.noticeview", nnumber);
	}
	
	

}
