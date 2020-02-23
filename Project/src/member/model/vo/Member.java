package member.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class Member implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberNo; //회원번호
	private String memberEmail; //회원이메일
	private String password; //회원 패스워드
	private String memberName; //회원 이름
	private Date birthDay; //회원 생년월일
	private String phone; //회원 전화번호
	private Date enrollDate; //회원 가입일
	private String grade; //회원 등급
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberNo, String memberEmail, String password, String memberName, Date birthDay, String phone,
			Date enrollDate, String grade) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.password = password;
		this.memberName = memberName;
		this.birthDay = birthDay;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.grade = grade;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", password=" + password
				+ ", memberName=" + memberName + ", birthDay=" + birthDay + ", phone=" + phone + ", enrollDate="
				+ enrollDate + ", grade=" + grade + "]";
	}

	
	
	
	

}
