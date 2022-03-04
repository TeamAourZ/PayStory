package com.AourZ.PayStory.model;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUtils {
	private static final String filePath = "/usr/local/tomcat9/webapps/ROOT/WEB-INF/classes/static/paystory/images/"; // 파일이 저장될 서버 위치
	
	public static String updateImg(
			MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception{
		
		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		String memberImage = "";

    String memberNo = (String) session.getAttribute("memberNo");
		// 회원번호별 새 폴더 생성
		String uploadPath = filePath + "member/" + memberNo + "/";
		
		File file = new File(uploadPath);
		if(file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				file = new File(uploadPath + storedFileName);
				multipartFile.transferTo(file);
				memberImage = storedFileName;
			}
		}
		return memberImage;
	}

	public static String[] uploadReceipt(MultipartFile multipartFile, HttpSession session) throws IOException {
		String memberNo = (String) session.getAttribute("memberNo");
		
		// 회원번호별 새 폴더 생성
		String uploadPath = filePath + "receipt/" + memberNo + "/";

    File file = new File(uploadPath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		String originalFileName = multipartFile.getOriginalFilename();
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 파일 중복 방지를 위한 UUID 생성
		String storedFileName = getRandomString() + originalFileExtension;
		
		// 업로드 파일 이름 : "memberNo_accountBookNo_파일이름"
		String uploadFileName = memberNo +"_"+ session.getAttribute("accountBookNo") +"_"+storedFileName;
		String filePathName = uploadPath + uploadFileName;

		File file1 = new File(filePathName);

		multipartFile.transferTo(file1);
		
		String result[] =  {filePathName, uploadFileName};
		
		return result;
	}
	
	public static void uploadBoard(MultipartFile multipartFile, int boardNo, HttpSession session) throws IOException {
		String memberNo = (String) session.getAttribute("memberNo");
		
		// 회원번호별 새 폴더 생성
		String uploadPath = filePath + "board/" + memberNo + "/";
		
		File file = new File(uploadPath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		String originalFileName = multipartFile.getOriginalFilename();
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 파일 중복 방지를 위한 UUID 생성
		String storedFileName = getRandomString() + originalFileExtension;
		
		// 업로드 파일 이름 : "memberNo_boardNo_파일이름"
		String uploadFileName = memberNo +"_"+ boardNo +"_"+storedFileName;
		String filePathName = uploadPath + uploadFileName;

		File file1 = new File(filePathName);

		multipartFile.transferTo(file1);
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
