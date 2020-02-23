package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import member.model.service.MemberService;
import member.model.vo.Member;
import tour_staff.model.service.StaffService;
import tour_staff.model.vo.Staff;

/**
 * Servlet implementation class AdminLoginEnd
 */
@WebServlet("/admin/adminLoginEnd")
public class AdminLoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Member admin = new AdminService().selectAdminOne(email);
		System.out.println("admin객체=" + admin);
		
		Staff staff = new StaffService().selectOne(email);
		System.out.println("staff객체=" + staff);
		String msg = "";
		String log = "/";

		// staff 로그인
		if (staff != null) {
			// 아이디와 비밀번호 일치
			if (password.equals(staff.getPassword())) {
				msg = "로그인 성공!";
				HttpSession session = request.getSession();

				Staff staffLoggedIn = staff;

				session.setAttribute("staffLoggedIn", staffLoggedIn);
				session.setMaxInactiveInterval(60 * 30);

				String saveStaffEmail = request.getParameter("saveStaffEmail");
				System.out.println("saveStaffEmail@servlet=" + saveStaffEmail);

				// 도메인당 50개, 하나의 크기는 4kb가 넘지 않도록 해야 모든 브라우져에서 호환된다.
				Cookie c = new Cookie("saveStaffEmail", email);
				c.setPath("/");// 도메인 전역에서 쿠키사용(서버전송)
				if (saveStaffEmail != null) {
					c.setMaxAge(7 * 24 * 60 * 60); // 쿠키의 유효기간(초): 7일(영속쿠키)
				} else {
					c.setMaxAge(0);// 쿠키 즉시삭제
									// 음수(혹은 생략): 브라우져 종료시 삭제(세션쿠키) 기본값 :세션쿠키
				}
				response.addCookie(c); // 공통

				// 로그인후 인덱스페이지로 리다이렉트처리
				// 클라이언트로 하여금 이 url(/mvc)로 다시 요청하도록함.
				//response.sendRedirect(request.getContextPath());
				
				//관광지관리자 페이지로 이동
				request.getRequestDispatcher("/WEB-INF/views/staff/staffDashboard.jsp").forward(request, response);

				return; // 코드가 더 흐르지 않도록 리턴문 작성

			}
			// 아이디일치 비밀번호 불일치
			else {
				msg = "입력하신 비밀번호가 틀렸습니다.";
			}

		} 
		//관리자 로그인
		else if (admin != null) {
			// 아이디와 비밀번호 일치
			if (password.equals(admin.getPassword())) {
				log = "/";
				msg = "로그인 성공!";
				HttpSession session = request.getSession();

				Member adminLoggedIn = admin;
				session.setAttribute("memberLoggedIn", adminLoggedIn);
				session.setMaxInactiveInterval(60 * 30);

				String saveAdminEmail = request.getParameter("saveAdminEmail");
				System.out.println("saveAdminEmail@servlet=" + saveAdminEmail);

				// 도메인당 50개, 하나의 크기는 4kb가 넘지 않도록 해야 모든 브라우져에서 호환된다.
				Cookie c = new Cookie("saveAdminEmail", email);
				c.setPath("/");// 도메인 전역에서 쿠키사용(서버전송)
				if (saveAdminEmail != null) {
					c.setMaxAge(7 * 24 * 60 * 60); // 쿠키의 유효기간(초): 7일(영속쿠키)
				} else {
					c.setMaxAge(0);// 쿠키 즉시삭제
					// 음수(혹은 생략): 브라우져 종료시 삭제(세션쿠키) 기본값 :세션쿠키
				}
				response.addCookie(c); // 공통

				// 로그인후 인덱스페이지로 리다이렉트처리
				// 클라이언트로 하여금 이 url(/mvc)로 다시 요청하도록함.
				//response.sendRedirect(request.getContextPath());
				
				//관리자페이지로 이동
				request.getRequestDispatcher("/WEB-INF/views/admin/adminDashboard.jsp").forward(request, response);
				return; // 코드가 더 흐르지 않도록 리턴문 작성

			}
			// 아이디일치 비밀번호 불일치
			else {
				msg = "입력하신 비밀번호가 틀렸습니다.";
			}

		} 
		
		msg = "존재하지 않는 아이디입니다.";
		



		request.setAttribute("msg", msg);
		request.setAttribute("log", log);

		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
