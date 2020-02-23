package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/memeberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
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
		String memberEmail = request.getParameter("loginEmail");
		String password = request.getParameter("loginPassword");
		
		
		Member m = new MemberService().selectOne(memberEmail);

		
		String msg = "";
		String loc = "/";
		
		//3. 업무로직
		
		//이 아이디의 member 객체가 null이 아니면 true
		if(m != null) {
			
			//패스워드까지 일치할 경우 로그인 성공
			if(password.equals(m.getPassword())) {
				
				msg = "로그인에 성공하셨습니다!";
		
				//로그인한 사용자를 session객체에 memberLoggedIn속성으로 저장  
				HttpSession session = request.getSession();
				String sessionId = session.getId();
				System.out.println("sessionId@servlet="+sessionId);
				
				Member memberLoggedIn = m;
				
				session.setAttribute("memberLoggedIn", memberLoggedIn);
				
				//로그인한 사용자 세션객체 타임아웃설정(개별세션) : 초
				session.setMaxInactiveInterval(60*30);
				
				//아이디저장 쿠키관련
				String saveId = request.getParameter("saveId");
				System.out.println("saveId@servlet="+saveId);
				
				//도메인당 50개, 하나의 크기는 4kb가 넘지 않도록 해야 모든 브라우져에서 호환된다.
				Cookie c = new Cookie("saveId", memberEmail);
				c.setPath("/");//도메인 전역에서 쿠키사용(서버전송)
				if(saveId != null) {
					c.setMaxAge(7*24*60*60);//쿠키의 유효기간(초): 7일(영속쿠키)
				}
				else {
					c.setMaxAge(0);//쿠키 즉시삭제
								   //음수(혹은 생략): 브라우져 종료시 삭제(세션쿠키)
				}
				response.addCookie(c);
				
				//로그인후 인덱스페이지로 리다이렉트 처리
				//클라이언트로 하여금 이 url(/mvc)로 다시 요청하도록함.
//				response.sendRedirect(request.getContextPath());
				
				//사용자가 있었던 페이지로 리다이렉트한다.
//				String referer = request.getHeader("Referer");//요청이 일어난 페이지주소
				String referer = (String)session.getAttribute("sessionURL");
				
				
				
				response.sendRedirect(referer);
				
				return;
				
			}//패스워드가 일치하지 않을 경우
			else {
				
				msg = "비밀번호가 틀렸습니다!";
				
			}
		}//null이면 false 바로 로그인 실패
		else {
			
			msg = "아이디가 틀렸습니다!";
			
		}
		System.out.println("msg="+msg);
		
		//4.view단 처리 포워딩
		
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