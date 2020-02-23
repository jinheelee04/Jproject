package board.free_board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FreeBoard implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int freeBoardNo;
	private String freeBoardTitle;
	private String freeBoardWriter;
	private String freeBoardContent;
	private String freeOriginalFileName;
	private String freeRenamedFileName;
	private Date freeBoardDate;
	private int freeReadCount;
	public FreeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FreeBoard(int freeBoardNo, String freeBoardTitle, String freeBoardWriter, String freeBoardContent,
			String freeOriginalFileName, String freeRenamedFileName, Date freeBoardDate, int freeReadCount) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.freeBoardTitle = freeBoardTitle;
		this.freeBoardWriter = freeBoardWriter;
		this.freeBoardContent = freeBoardContent;
		this.freeOriginalFileName = freeOriginalFileName;
		this.freeRenamedFileName = freeRenamedFileName;
		this.freeBoardDate = freeBoardDate;
		this.freeReadCount = freeReadCount;
	}
	public int getFreeBoardNo() {
		return freeBoardNo;
	}
	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}
	public String getFreeBoardTitle() {
		return freeBoardTitle;
	}
	public void setFreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}
	public String getFreeBoardWriter() {
		return freeBoardWriter;
	}
	public void setFreeBoardWriter(String freeBoardWriter) {
		this.freeBoardWriter = freeBoardWriter;
	}
	public String getFreeBoardContent() {
		return freeBoardContent;
	}
	public void setFreeBoardContent(String freeContent) {
		this.freeBoardContent = freeContent;
	}
	public String getFreeOriginalFileName() {
		return freeOriginalFileName;
	}
	public void setFreeOriginalFileName(String freeOriginalFileName) {
		this.freeOriginalFileName = freeOriginalFileName;
	}
	public String getFreeRenamedFileName() {
		return freeRenamedFileName;
	}
	public void setFreeRenamedFileName(String freeRenamedFileName) {
		this.freeRenamedFileName = freeRenamedFileName;
	}
	public Date getFreeBoardDate() {
		return freeBoardDate;
	}
	public void setFreeBoardDate(Date freeBoardDate) {
		this.freeBoardDate = freeBoardDate;
	}
	public int getFreeReadCount() {
		return freeReadCount;
	}
	public void setFreeReadCount(int freeReadCount) {
		this.freeReadCount = freeReadCount;
	}
	@Override
	public String toString() {
		return "FreeBoard [freeBoardNo=" + freeBoardNo + ", freeBoardTitle=" + freeBoardTitle + ", freeBoardWriter="
				+ freeBoardWriter + ", freeContent=" + freeBoardContent + ", freeOriginalFileName=" + freeOriginalFileName
				+ ", freeRenamedFileName=" + freeRenamedFileName + ", freeBoardDate=" + freeBoardDate
				+ ", freeReadCount=" + freeReadCount + "]";
	}
	

}
