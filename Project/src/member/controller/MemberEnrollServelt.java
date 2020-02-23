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
 * Servlet implementation class MemberEnrollServelt
 */
@WebServlet("/member/memeberEnroll")
public class MemberEnrollServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 핸들링
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		System.out.println("Servlet@="+email+" "+password+" "+memberName+" "+phone+" "+birthday);
		
		//생일 문자형 -> 날짜형
		Date birthday_ = null;
		if(!"".equals(birthday)) birthday_ = Date.valueOf(birthday);
		
		//업무로직
		Member m = new Member();
		m.setMemberEmail(email);
		m.setPassword(password);
		m.setMemberName(memberName);
		m.setPhone(phone);
		m.setBirthDay(birthday_);
		
		int result = new MemberService().insertMember(m);
		
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg ="회원 가입 성공!";
			loc = "/";
		}else {
			msg ="회원 가입 실패! 다시 시도해 주세요!";
			loc = "/";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
