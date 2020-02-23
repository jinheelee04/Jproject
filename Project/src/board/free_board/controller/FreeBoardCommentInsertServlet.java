package board.free_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.free_board.model.service.FreeBoardSerivce;
import board.free_board.model.vo.FreeBoardComment;

/**
 * Servlet implementation class FreeBoardCommentInsertServlet
 */
@WebServlet("/board/free_board/freeBoardCommentInsert")
public class FreeBoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 핸들링
		int freeBoardRef = Integer.parseInt(request.getParameter("boardRef"));
		String freeBoardCommentWriter = request.getParameter("boardCommentWriter");
		String freeBoardCommentContent = request.getParameter("boardCommentContent");
		int freeBoardCommentLevel = Integer.parseInt(request.getParameter("boardCommentLevel"));
		int freeBoardCommentRef = Integer.parseInt(request.getParameter("boardCommentRef"));
		
		FreeBoardComment bc = new FreeBoardComment(0, freeBoardCommentLevel, freeBoardCommentWriter, freeBoardCommentContent, freeBoardRef, freeBoardCommentRef, null);
		
		int result = new FreeBoardSerivce().insertBoardComment(bc);
		
		//3.view단 처리: 댓글등록여부를 msg.jsp를 통해서 알림후,
		// 				/board/boardView로 이동
		
		String msg = "";
		String loc = "/board/free_board/boardView?boardNo="+freeBoardRef;
		if(result>0) {
			msg = "댓글 입력 성공!";
		}else {
			msg = "댓글 입력 실패!";
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
