package cumtrip.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import cumtrip.vo.MemberVO;
import cumtrip.vo.MiddleVO;

public class PlaceDao {
	private static PlaceDao dao;
	private PlaceDao() {}
	public static PlaceDao getInstance() {
		if(dao == null) dao = new PlaceDao();
		return dao;
	}
	
	public int insertspace(SqlMapClient smc, Map<String,Object> map) throws SQLException{
		int result = 0;
		Object temp = null;
		temp = smc.insert("middle.insertspace", map);
		if(temp == null) {
			result = 1;
		}else {
			result =0;
		}
		
		return result;
	}
	public List<MiddleVO> selectallspace(SqlMapClient smc) throws SQLException{
		List<MiddleVO> list = null; 
		list = smc.queryForList("middle.selectallspace");
		
		return list;
	
	}
	public MiddleVO selectonespace(SqlMapClient smc,String midno) throws SQLException{
		MiddleVO vo = null;
		
		vo = (MiddleVO)smc.queryForObject("middle.selectonespace" ,midno );
		
		return vo;
	}
}
