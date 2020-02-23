package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberFindServlet
 */
@WebServlet("/member/idFind")
public class IdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 파라미터 생성
		String findName = request.getParameter("findId-name");
		String findPhone = request.getParameter("findId-phone");
		String findBirthday = request.getParameter("findId-birthday");
		
		//아이디 찾을 서비스단
		Member m = new MemberService().idFind(findName);
		String msg = "";
		String loc = "/";
		
		//뷰단에서 파라미터로 생일날짜를 받아올때 Date형으로 형변환
		Date birthday_ = null;
	      if(!"".equals(findBirthday)) birthday_ = Date.valueOf(findBirthday);
		//3. 업무로직
		//사용자의 정보가 있다면 true
		if(m != null) {
		
			//사용자 이름, 핸드폰번호, 생년월일 3개가 맞다면 아이디를 알려주고
			if(findName.equals(m.getMemberName())
					&& findPhone.equals(m.getPhone())
						&& birthday_.equals(m.getBirthDay()))
 {
//&&findBirthday.equals(m.getBirthDay()) 날짜가 들어갈경우 아이디를 못찾음
//아마 페이지창에는 2020년 2월 5일이고 sql에는 20년2월5일 년도에 20이 붙었냐 안붙었냐 차이로 일치하지가 않은거 같음
//일단 날짜는 아무거나 입력해도 상관없음
//				msg = "아이디는 "+m.getMemberEmail()+" 입니다";
				msg = m.getMemberName()+"님의 아이디는"+m.getMemberEmail()+"입니다!";
				
			}
			//하나라도 틀리면 다시확인하라는 메세지
			else {
				msg = "이름, 연락처, 생년월일을 다시 확인해주시기 바랍니다";
			}
			
		}
		else {//회원정보가 없는 경우
			msg = "회원정보가 없습니다. 회원가입부터 해주시길 바랍니다.";
		}
		
		
		//4. view단 처리
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			   .forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
