package tour_staff.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import tour_staff.model.dao.StaffDAO;
import tour_staff.model.vo.Staff;

public class StaffService {
	public Staff selectOne(String staffEmail) {

		Connection conn = getConnection();
		Staff staff = new StaffDAO().selectOne(conn, staffEmail);
		close(conn);
		return staff;
	}
}
