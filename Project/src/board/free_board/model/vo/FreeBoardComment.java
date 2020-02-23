package board.free_board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FreeBoardComment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int freeBoardCommentNo;
	private int freeBoardCommentLevel;
	private String freeBoardCommentWriter;
	private String freeBoardCommentContent;
	private int freeBoardRef;
	private int freeBoardCommentRef;
	private Date freeBoardCommentDate;
	public FreeBoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoardComment(int freeBoardCommentNo, int freeBoardCommentLevel, String freeBoardCommentWriter,
			String freeBoardCommentContent, int freeBoardRef, int freeBoardCommentRef, Date freeBoardCommentDate) {
		super();
		this.freeBoardCommentNo = freeBoardCommentNo;
		this.freeBoardCommentLevel = freeBoardCommentLevel;
		this.freeBoardCommentWriter = freeBoardCommentWriter;
		this.freeBoardCommentContent = freeBoardCommentContent;
		this.freeBoardRef = freeBoardRef;
		this.freeBoardCommentRef = freeBoardCommentRef;
		this.freeBoardCommentDate = freeBoardCommentDate;
	}
	public int getFreeBoardCommentNo() {
		return freeBoardCommentNo;
	}
	public void setFreeBoardCommentNo(int freeBoardCommentNo) {
		this.freeBoardCommentNo = freeBoardCommentNo;
	}
	public int getFreeBoardCommentLevel() {
		return freeBoardCommentLevel;
	}
	public void setFreeBoardCommentLevel(int freeBoardCommentLevel) {
		this.freeBoardCommentLevel = freeBoardCommentLevel;
	}
	public String getFreeBoardCommentWriter() {
		return freeBoardCommentWriter;
	}
	public void setFreeBoardCommentWriter(String freeBoardCommentWriter) {
		this.freeBoardCommentWriter = freeBoardCommentWriter;
	}
	public String getFreeBoardCommentContent() {
		return freeBoardCommentContent;
	}
	public void setFreeBoardCommentContent(String freeBoardCommentContent) {
		this.freeBoardCommentContent = freeBoardCommentContent;
	}
	public int getFreeBoardRef() {
		return freeBoardRef;
	}
	public void setFreeBoardRef(int freeBoardRef) {
		this.freeBoardRef = freeBoardRef;
	}
	public int getFreeBoardCommentRef() {
		return freeBoardCommentRef;
	}
	public void setFreeBoardCommentRef(int freeBoardCommentRef) {
		this.freeBoardCommentRef = freeBoardCommentRef;
	}
	public Date getFreeBoardCommentDate() {
		return freeBoardCommentDate;
	}
	public void setFreeBoardCommentDate(Date freeBoardCommentDate) {
		this.freeBoardCommentDate = freeBoardCommentDate;
	}
	@Override
	public String toString() {
		return "FreeBoardComment [freeBoardCommentNo=" + freeBoardCommentNo + ", freeBoardCommentLevel="
				+ freeBoardCommentLevel + ", freeBoardCommentWriter=" + freeBoardCommentWriter
				+ ", freeBoardCommentContent=" + freeBoardCommentContent + ", freeBoardRef=" + freeBoardRef
				+ ", freeBoardCommentRef=" + freeBoardCommentRef + ", freeBoardCommentDate=" + freeBoardCommentDate
				+ "]";
	}
	
	

}
