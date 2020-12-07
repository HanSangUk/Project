package com.army.choo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.choo.dto.AlarmDTO;
import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.GgymDTO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.dto.PageDTO;
import com.army.choo.dto.PayDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	//기업회원가입
	public int comMemberInsertForm(ComMemberDTO mDTO) {
		return sql.insert("Member.ComMemberInsert", mDTO);
	}

	//전체 지점수
	public int listcount() {
		return sql.selectOne("Member.commembercount");
	}

	//시작 행과 끝 행을 가지고 지점 수 가져오기
	public List<GgymDTO> commemberListpaging(PageDTO pdto) {
		return sql.selectList("Member.commemberlist",pdto);
	}

	//기업 로그인
		public String comLoginForm(ComMemberDTO mDTO) {
			return sql.selectOne("Member.ComLoginForm", mDTO);
		}
	
	//일반회원 회원가입
	public int memberinsert(MemberDTO member) {
		return sql.insert("Member.memberInsert", member);
	}

	//아이디 중복체크
	public String idOverlap(String mid) {
		return sql.selectOne("Member.idOverlap",mid);
	}

	//일반회원 로그인
	public int memberlogin(MemberDTO member) {
		return sql.selectOne("Member.memberLogin",member);
	}
	//기업회원정보수정 정보불러오기(수정 페이지로 이동)
	public ComMemberDTO comMemberUpdate(String comnumber) {
		return sql.selectOne("Member.ComMemberUpdate", comnumber);
	}
		
	//기업회원정보수정
	public int comMemberUpdateForm(ComMemberDTO mDTO) {
		return sql.update("Member.ComMemberUpdateForm", mDTO);
	}
	//기업회원탈퇴
	public int comMemberOutForm(ComMemberDTO mDTO) {
		return sql.delete("Member.ComMemberDeleteForm", mDTO);
	}
	//기업회원 마이페이지
	public ComMemberDTO comMyPage(String comnumber) {
		return sql.selectOne("Member.ComMyPage", comnumber);
	}
	//일반회원 마이페이지
	public MemberDTO mypage(String mid) {
	    return sql.selectOne("Member.myPage",mid);
	}
	// 일반회원 수정창으로
	public MemberDTO memberUpdate(MemberDTO member) {
	    return sql.selectOne("Member.memberUpdate",member);
	}
	// 일반회원 수정처리
	public int memberUpdateProcess(MemberDTO member) {
	    return sql.update("Member.memberUpdateProcess",member);
	}
	// 일반회원 탈퇴
	public int memberOut(String mid) {
	    return sql.delete("Member.memberOut",mid);
	}
	//지점 리스트
	public List<ComMemberDTO> officeList(String company) {
		return sql.selectList("Member.officeList", company);
	}
	//이메일인증1
	public void GetKey(MemberDTO member) {
		sql.update("Member.GetKey",member);
	}
	//이메일인증2 
	public int alter_userKey(MemberDTO member) {
		return sql.update("Member.alrer_userKey",member);
	}

	//----- 검색 ----------------------------------------------------------------------
	
	//메인검색용 지점수 
	public int listCount(String searchInput) {
		return sql.selectOne("Member.officeCount", searchInput);
	}
	//메인검색 페이징
	public List<ComMemberDTO> officeListPaging(PageDTO paging) {
		return sql.selectList("Member.officepaging", paging);
	}	
	//카카오페이용 맴버 검색
	public MemberDTO memberdetailService(String partner_user_id) {
		return sql.selectOne("Member.memberdetailService", partner_user_id);
	}
	//카카오페이 지점명 검색
	public String productService(int pnumber) {
		return sql.selectOne("Member.productService", pnumber);
	}
	//지점리스트(페이징)
	public List<ComMemberDTO> officeLists(PageDTO page) {
		return sql.selectList("Member.officeLists", page);
	}
	//지점리스트(페이징 카운트)
	public int listcounts(String mid) {
		return sql.selectOne("Member.ggymlist", mid);
	}
	//홈 리스트
	public ComMemberDTO comMemberDate(String comnumber) {
		return sql.selectOne("Member.comdata", comnumber);
	}
	//카카오로그인
	public String kakaoLogin(String kakaoId) {
		return sql.selectOne("Member.kakaoLogin", kakaoId);
	}
	//네이버로그인	
	public String naverLogin(String naverId) {
		return sql.selectOne("Member.naverLogin", naverId);
	}
	   // 구매목록
	public List<PayDTO> payList(PageDTO pdto) {
	      return sql.selectList("Member.payList",pdto);
	   }
	
	//구매목록 페이징 카운트
	public int paycount(String payid) {
		return sql.selectOne("Member.payCount", payid);
	}	   
	
	   public int alarmCount(String amid) {
			return sql.selectOne("Member.alarmCount",amid);
		}

		public List<AlarmDTO> alarmList(PageDTO paging) {
			return sql.selectList("Member.alarmList", paging);
		}

		public List<PayDTO> commemberpayList(PageDTO pdto) {
			return sql.selectList("Member.commemberpayList",pdto);
		}

		public int listcount(String comnumber) {
			return sql.selectOne("Member.listCount", comnumber);
		}

		public ComMemberDTO comoffice(String loginId) {
	         return sql.selectOne("Member.comoffice",loginId);
	      }
		public void alarmConfirm() {
			sql.update("Member.alarmConfirm");
		}

		public MemberDTO memberCoordinates(String mid) {
			return sql.selectOne("Member.memberCoordinates",mid);
		}

		public ComMemberDTO comCoordinates(String comnumber) {
			return sql.selectOne("Member.comCoordinates", comnumber);
		}

		public int alarmlistCount(String amid) {
			return sql.selectOne("Member.alarmlistCount", amid);
		}
}
