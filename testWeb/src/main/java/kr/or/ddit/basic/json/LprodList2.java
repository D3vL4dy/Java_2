package kr.or.ddit.basic.json;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lprodList2.do")
public class LprodList2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); // 파라미터가 있을 경우 적어줌
		
		LprodDao lprodDao = LprodDao.getInstance();
		
		List<LprodVO> lprodList = lprodDao.getLprodList();
		// servlet은 데이터를 가져오는 역할까지만 하고 jsp로 넘겨줌 (forward방식)
		
		// View로 보내줄 데이터를 request객체에 저장한다.
		request.setAttribute("list", lprodList);
		
		// View페이지로 forwarding한다.
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/lprod/lprodList.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
