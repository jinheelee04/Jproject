package member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.*;
import member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO(){
		//sql member prorperties 불러오기
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
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
	
	//회원가입
	public int insertMember(Connection conn, Member m) {
		//DB연결
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberEmail());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getPassword());
			pstmt.setDate(4, m.getBirthDay());
			pstmt.setString(5, m.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//연결 끊기
			close(conn);
		}
		
		
		return result;
	}
	
	//아이디 중복검사
	public int selectIdChk(Connection conn, String email) {
		//DB연결
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("selectIdChk");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			//쿼리문에서 select를 count로 받아온다 따라서 int로 결과 값을 받아온다.
			if(rset.next())
				result = rset.getInt("result");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}
	
	//로그인
	public Member selectOne(Connection conn, String memberEmail) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String query = prop.getProperty("selectOne");
		System.out.println("query@="+query);
		
		
		try {
			//미완성쿼리객체 생성
			pstmt = conn.prepareStatement(query);
			
			//미완서쿼리 값 대입
			pstmt.setString(1, memberEmail);
			
			//쿼리문 실행
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirthDay(rset.getDate("member_birth"));
				m.setPhone(rset.getString("member_phone"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));
				m.setGrade(rset.getString("grade"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
			
		return m;
	}
	
	//아이디 찾기 DAO
	public Member idFind(Connection conn, String findName) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = prop.getProperty("idFind");
		
		try {
			//미완성쿼리객체 생성
			pstmt = conn.prepareStatement(query);
			
			//미완성쿼리 값 대입
			pstmt.setString(1, findName);
			
			//쿼리 실행
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Member();
				
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirthDay(rset.getDate("member_birth"));
				m.setPhone(rset.getString("member_phone"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));
				m.setGrade(rset.getString("grade"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}
	
	//패스워드 찾기 DAO
	public Member passwordFind(Connection conn, String fpEmail) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = prop.getProperty("passwordFind");

		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, fpEmail);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Member();
				
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setPassword(rset.getString("member_password"));
				m.setMemberName(rset.getString("member_name"));
				m.setBirthDay(rset.getDate("member_birth"));
				m.setPhone(rset.getString("member_phone"));
				m.setEnrollDate(rset.getDate("member_enrolldate"));
				m.setGrade(rset.getString("grade"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

}
