package cumtrip.main.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cumtrip.vo.Lo_searchVO;
import cumtrip.vo.MemberVO;
import cumtrip.vo.MiddleVO;
import cumtrip.vo.SubPrintVO;


public interface IMemberDao {


	
	//중복검사 메서드
	public MemberVO Count( String id )throws SQLException;
	
	
	//저장하기
	public String insert( MemberVO vo )throws SQLException;
	
	
	//로그인
	public MemberVO getMember(MemberVO memVo)throws SQLException;
	
	//검색시 시도 나오는 메서드
	public List<Lo_searchVO> getSido() throws SQLException;
	
	
	//아이디찾기
	public MemberVO idFind(MemberVO vo)throws SQLException;
		
	//비밀번호찾기
	public MemberVO passFind(MemberVO vo)throws SQLException;
		
	//비밀번호변경
	public int PassSetFind(MemberVO vo)throws SQLException;
	
	//회원정보변경
	public int updateMember_Mypage(MemberVO vo)throws SQLException;
	
	//회원탈퇴
	public int deleteMember_Mypage(MemberVO vo)throws SQLException;
	
	//메인 인기여행지 목록
    public List<SubPrintVO>	maintourlist() throws SQLException;
    
    public List<SubPrintVO>	maintourlist2() throws SQLException;
    
    public List<SubPrintVO>	maintourlist3() throws SQLException;
	
	//좋아요목록조회
	public List<MemberVO> likeMypage01( Map<String,String> id )throws SQLException;
	
	//찜풀기m
	public int likeMypagedelect( MemberVO vo )throws SQLException;
	
	//찜풀기s
	public int likeMypagedelect2( MemberVO vo )throws SQLException;
	
	//리뷰목록조회
	public List<MemberVO> reviweMypage01(Map<String, String> id)throws SQLException;
	
	//메인 추천 여행지
	public List<SubPrintVO> mainrandomtourlist() throws SQLException;

	//결제목록보기
	public List<MemberVO> payMypage01( String id )throws SQLException;

	// 메인 인기순 여행지 
	public List<SubPrintVO> mainrectourlist()throws SQLException;
	
	
}
