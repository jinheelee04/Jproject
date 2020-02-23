package board.free_board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.print.attribute.standard.PresentationDirection;

import static common.JDBCTemplate.*;

import board.free_board.model.vo.FreeBoard;
import board.free_board.model.vo.FreeBoardComment;
import member.model.dao.MemberDAO;

public class FreeBoardDAO {
	
	private Properties prop = new Properties();
	
	public FreeBoardDAO() {
		//sql member prorperties 불러오기
				String fileName = MemberDAO.class.getResource("/sql/board/free_board/freeBoard-query.properties").getPath();
				
				try {
					prop.load(new FileReader(fileName));
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
	
	//게시물 표현
	public List<FreeBoard> selectBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<FreeBoard> list = new ArrayList<FreeBoard>();
		FreeBoard b = null;
		String query = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(query);
			int startRownum = (numPerPage*cPage)-(numPerPage-1);
			int endRownum = numPerPage*cPage;
			
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b = new FreeBoard();
				b.setFreeBoardNo(rset.getInt("free_board_no"));
				b.setFreeBoardTitle(rset.getString("free_board_title"));
				b.setFreeBoardWriter(rset.getString("free_board_writer"));
				b.setFreeBoardContent(rset.getString("free_board_content"));
				b.setFreeOriginalFileName(rset.getString("free_board_original_filename"));
				b.setFreeRenamedFileName(rset.getString("free_board_renamed_filename"));
				b.setFreeBoardDate(rset.getDate("free_board_date"));
				b.setFreeReadCount(rset.getInt("free_board_readcount"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	//총 게시물 갯수
	public int selectTotalContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String query = prop.getProperty("selectTotalContents");
		
		try {
			//미완성 쿼리 값 대입
			pstmt= conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalContents = rset.getInt("cnt");
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return totalContents;
	}
	//선택한 게시글
	public FreeBoard selectBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		FreeBoard b = null;
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new FreeBoard();
				b.setFreeBoardNo(rset.getInt("free_board_no"));
				b.setFreeBoardTitle(rset.getString("free_board_title"));
				b.setFreeBoardWriter(rset.getString("free_board_writer"));
				b.setFreeBoardContent(rset.getString("free_board_content"));
				b.setFreeOriginalFileName(rset.getString("free_board_original_filename"));
				b.setFreeRenamedFileName(rset.getString("free_board_renamed_filename"));
				b.setFreeBoardDate(rset.getDate("free_board_date"));
				b.setFreeReadCount(rset.getInt("free_board_readcount"));
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return b;
	}
	
	//조회수
	public int increaseReadCount(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = prop.getProperty("increaseReadCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<FreeBoardComment> selectCommentList(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		FreeBoardComment b = null;
		List<FreeBoardComment> list = new ArrayList<FreeBoardComment>();
		String query = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				b = new FreeBoardComment();
				b.setFreeBoardCommentNo(rset.getInt("free_board_comment_no"));
				b.setFreeBoardCommentLevel(rset.getInt("free_board_comment_level"));
				b.setFreeBoardCommentWriter(rset.getString("free_board_comment_writer"));
				b.setFreeBoardCommentContent(rset.getString("free_board_comment_content"));
				b.setFreeBoardRef(rset.getInt("free_board_ref"));
				b.setFreeBoardCommentRef(rset.getInt("free_board_comment_ref"));
				b.setFreeBoardCommentDate(rset.getDate("free_board_comment_date"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//댓글 입력
	public int insertBoardComment(Connection conn, FreeBoardComment bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBoardComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bc.getFreeBoardCommentLevel());
			pstmt.setString(2, bc.getFreeBoardCommentWriter());
			pstmt.setString(3, bc.getFreeBoardCommentContent());
			pstmt.setInt(4, bc.getFreeBoardRef());
			
			//참조하는 댓글 -> 대댓인지 댓글인지..
			//댓글 참조: board_comment_ref
			//댓글 : null
			//대댓글 : 참조하는 댓글의 board_comment_no
			pstmt.setString(5, bc.getFreeBoardCommentRef()==0?null:String.valueOf(bc.getFreeBoardCommentRef()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteComment(Connection conn, int delNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, delNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//게시물 삭제
	public int deleteBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteBoard");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertBoard(Connection conn, FreeBoard b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBoard");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getFreeBoardTitle());
			pstmt.setString(2, b.getFreeBoardWriter());
			pstmt.setString(3, b.getFreeBoardContent());
			pstmt.setString(4, b.getFreeOriginalFileName());
			pstmt.setString(5, b.getFreeRenamedFileName());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(conn);
		}
		return result;
	}
}
