package board.free_board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.free_board.model.service.FreeBoardSerivce;
import board.free_board.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardListServlet
 */
@WebServlet("/board/free_board/freeBoardList")
public class FreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private FreeBoardSerivce freeBoardService = new FreeBoardSerivce();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/**
		 * <h1>페이징 레시피
		 * 
		 * 공식1(contents영역): 시작rownum/끝rownum
		 * 공식2(pagebar영역): 총페이지수(totalPage) 구하기
		 * 공식3(pagebar영역): 페이지바 시작번호(pageStart)
		 * 
		 * 1.cPage(현재페이지)
		 * 2.numPerPage(한 페이지당 게시물 수)
		 * 3.totalContents(총 게시물 수)
		 * 4.totalPage(총 페이지 수)
		 * 5.pageBarSize(표시할 페이지수)
		 * 6.pageNo(페이지 증감변수)
		 * 7.pageStart / pageEnd
		 * 
		 */
		
		//1.파라미터 핸들링
		final int numPerPage = 2;
		int cPage = 1;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			
		}
		
		//2.업무로직
		List<FreeBoard> list = freeBoardService.selectBoardList(cPage, numPerPage);
		
		//3.뷰단 처리
		int totalContents = freeBoardService.selectTotalContents();
		
		int totalPage = (int)Math.ceil(((double)totalContents/numPerPage));
		
		
		final int pageBarSize = 5;
		
		final int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;
		final int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		String pageBar = "";
		
		////////////////////////////////////////////이해 할것!///////////////////////////
		//[이전]
		//이전페이지버튼을 비활성하는 경우
		if(pageNo ==1) {
			
			pageBar += "<i class='far fa-caret-square-left' style='font-size:24px'></i>";
		}
		else {
			pageBar += "<a href='freeBoardList?cPage="+(pageNo-1)+"'><i class='fas fa-caret-square-left' style='font-size:24px'></i></a>";
		}
		
		//[pageNo]
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				pageBar += "<span class='cPage'><button class='w3-btn w3-white w3-border' disabled>"+pageNo+"</button></span>";
			}
			else {
				pageBar += "<a href='freeBoardList?cPage="+pageNo+"'><button class='w3-btn w3-white w3-border'>"+pageNo+"</button></a>";
			}	
			pageNo++;
		}
		
		//[다음]
		if(pageNo > totalPage) {
			pageBar += "<i class='far fa-caret-square-right' style='font-size:24px'></i>";
			System.out.println("pageNo="+pageNo);
			System.out.println("totalPage="+totalPage);
		}else {
			pageBar += "<a href='freeBoardList?cPage="+pageNo+"'><i class='fas fa-caret-square-right' style='font-size:24px'></i></a>";
		}	
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/board/free_board/freeBoardList.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
