package common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MvcFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		File newFile = null;
		do {
			//파일명 생성코드
			//기존파일의 확장자
			String oldName = oldFile.getName();
			String ext = "";
			int dotIndex = oldName.lastIndexOf(".");
			if(dotIndex > -1)
				ext = oldName.substring(dotIndex); // .txt
			
			//새파일명:yyyyNNdd_HHmmssSSS_rnd.txt
			String newName = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(new Date())
					+ "_" + (int)(Math.random()*1000) + ext;
			
			//새 파일 객체 생성
			newFile = new File(oldFile.getParent(),newName);
		}while(!createNewFile(newFile)); //파일을 만들때 까지 반복
		
		System.out.println("newFile@MvcFileRenamePolicy"+newFile);
		return newFile;
	}
	
	private boolean createNewFile(File f) {
	    try {
	    	/**
	    	 * 파일이 존재하지 않으면, 파일을 생성하고 true를 리턴
	    	 * 파일이 존재하면, 파일을 생성하지 않고 false를 리턴
	    	 */
	      return f.createNewFile();
	    }
	    catch (IOException ignored) {
	      return false;
	    }
	  }

}
