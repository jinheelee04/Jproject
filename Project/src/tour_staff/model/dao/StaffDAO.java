package tour_staff.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import admin.model.dao.AdminDAO;
import member.model.vo.Member;
import tour_staff.model.vo.Staff;

public class StaffDAO {
	private Properties prop = new Properties();
	public StaffDAO() {
		
		String fileName = AdminDAO.class.getResource("/sql/staff/staff-query.properties").getPath();
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
	public Staff selectOne(Connection conn, String staffEmail) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Staff staff = null;
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = conn.prepareStatement(query);
		    pstmt.setString(1, staffEmail);
		    System.out.println("memberDAO"+query);
		    rset = pstmt.executeQuery();
		    while(rset.next()) {
		    	staff = new Staff();
		
		    	staff.setStaffNo(rset.getString("tour_staff_no"));
		    	staff.setStaffEmail(rset.getString("tour_staff_email"));
		    	staff.setPassword(rset.getString("tour_staff_password"));
		    	staff.setName(rset.getString("tour_staff_name"));
		    	staff.setPhone(rset.getString("tour_staff_phone"));		    	
		    	staff.setEnrollDate(rset.getDate("tour_staff_enrolldate"));
		    	staff.setTourInfoId(rset.getString("tour_info_id")); 	
		    	
		    }
		    
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return staff;
	}
}
