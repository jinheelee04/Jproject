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
 * Servlet implementation class passwordFindServlet
 */
@WebServlet("/member/passwordFind")
public class PasswordFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordFindServlet() {
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
		String fpEmail = request.getParameter("findPassword-email");
		String fpName = request.getParameter("findPassword-name");
		String fpPhone = request.getParameter("findPassword-phone");
		String fpBirthday = request.getParameter("findPassword-birthday");
		
		Member m = new MemberService().passwordFind(fpEmail);
		String msg = "";
		String loc = "/";
		
		//뷰단에서 파라미터로 생일날짜를 받아올때 Date형으로 형변환
		Date birthday_ = null;
		if(!"".equals(fpBirthday)) birthday_ = Date.valueOf(fpBirthday);
		
		//3. 업무로직
		
		if(m != null) {
			
			if(fpEmail.equals(m.getMemberEmail())
					&&fpName.equals(m.getMemberName())
						&&fpPhone.equals(m.getPhone())
							&&birthday_.equals(m.getBirthDay())) {
				msg = m.getMemberName()+"님의 비밀번호는 "+m.getPassword()+"입니다!";
			}
			else {
				msg = "아아디, 이름, 연락처, 생년월일을 다시 확인해주시기 바랍니다";;
			}
			
		}//회원정보가 없는 경우
		else {
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
