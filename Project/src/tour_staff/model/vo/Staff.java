package tour_staff.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Staff implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String staffNo; // 스태프 고유번호 pk
	private String staffEmail; 
	private String password;
	private String name;
	private String phone;
	private Date enrollDate; 
	private String tourInfoId; // 관광지 아이디번호 (fk: tour_info)
	public Staff() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Staff(String staffNo, String staffEmail, String password, String name, String phone, Date enrollDate,
			String tourInfoId) {
		super();
		this.staffNo = staffNo;
		this.staffEmail = staffEmail;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.tourInfoId = tourInfoId;
	}
	public String getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(String staffNo) {
		this.staffNo = staffNo;
	}
	public String getStaffEmail() {
		return staffEmail;
	}
	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getTourInfoId() {
		return tourInfoId;
	}
	public void setTourInfoId(String tourInfoId) {
		this.tourInfoId = tourInfoId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Staff [staffNo=" + staffNo + ", staffEmail=" + staffEmail + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", enrollDate=" + enrollDate + ", tourInfoId=" + tourInfoId + "]";
	}
	
	
	
}
