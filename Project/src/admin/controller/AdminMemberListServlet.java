package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberList
 */
@WebServlet("/admin/adminMemberList")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.parameter handling
		final int numPerPage = 10; 
		int cPage = 1; //기본값 설정
		try {
			
			cPage = Integer.parseInt(request.getParameter("cPage")); //null이기 때문에
		}catch(NumberFormatException e) {
			
		}
		System.out.println("cPage="+cPage);
		
		//2.business logic
		List<Member> list = new AdminService().selectMemberList(cPage, numPerPage);
		
		//전체게시물수 totalContent
		int totalContents = new AdminService().selectTotalContents();
		
		//pageBar 작성하기
		//전체페이지수 : 
		//totalContent=115, numPerPage=10 => totalPage=12
		//tc=71, npp=10 => tp=8  :7.1 ->8
		final int totalPage= (int)Math.ceil((double)totalContents/numPerPage);
		
		//페이지바수(페이지에 표시될 페이지수)
		final int pageBarSize = 5;
		
		//시작페이지번호 세팅
		//cp=1 : 1 2 3 4 5  => 1,5 12345 -> 1
		//cp=2 : 1 2 3 4 5  => 1,5
		//cp=6 : 6 7 8 9 10 => 6,10 678910 ->2  11 12                    
		//cp=8 : 6 7 8 9 10 => 6,10
		final int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;		 		
		final int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		String pageBar = "";
		
		//[이전]
		//이전페이지버튼을 비활성화하는 경우
		if(pageNo ==1 ) {
			pageBar += "<span>[이전]</span>";
		}
		else {
			pageBar += "<a href='adminMemberList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		//[pageNo]
		while(pageNo<=pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				pageBar += "<span class='cPage'>"+pageNo+"</span>";
			}else {
				pageBar += "<a href='adminMemberList?cPage="+pageNo+"'>"+pageNo+"</a>";				
			}
			pageNo++;
		}
		//[다음]
		//하나 커진상태로 while문을 탈출했다.
		if(pageNo>totalPage) {
			pageBar += "<span>[다음]</span>";			
		}else {
			pageBar += "<a href='adminMemberList?cPage="+(pageNo)+"'>[다음]</a>";			
		}
		
		//3.view단 처리
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/adminMemberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
