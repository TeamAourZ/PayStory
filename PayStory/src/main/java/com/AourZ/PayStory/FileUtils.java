package com.AourZ.PayStory;

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
	private static final String filePath = "/upload/"; // 파일이 저장될 서버 위치
	//private static final String filePath = "C:/PayStory/images/"; // 로컬용
	
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
	
	// 회원 이미지 삭제 메서드
	public static void removeProfile(String memberNo, String fileName) throws IOException {
		// 서버에서 파일 삭제
		String deletePath = filePath + "member/" + memberNo + "/";
		String filePath = deletePath + fileName;
		File deleteFile = new File(filePath);
		
		if(deleteFile.exists()) {
            deleteFile.delete(); 
            // System.out.println("파일을 삭제하였습니다.");
        } else {
            System.out.println("파일이 존재하지 않습니다.");
        }
	}
	
	// 영수증 이미지 업로드 메서드
	public static String[] uploadReceipt(MultipartFile multipartFile, HttpSession session) throws IOException {
		String memberNo = (String) session.getAttribute("memberNo");
		
		// 가계부 번호별 새 폴더 생성
		String uploadPath = filePath + "receipt/" + session.getAttribute("accountBookNo") + "/";

		File file = new File(uploadPath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		String originalFileName = multipartFile.getOriginalFilename();
		String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 파일 중복 방지를 위한 UUID 생성
		String storedFileName = getRandomString() + originalFileExtension;
		
		// 업로드 파일 이름 : "memberNo_UUID"
		String uploadFileName = memberNo +"_"+ storedFileName;
		String filePathName = uploadPath + uploadFileName;

		File file1 = new File(filePathName);

		multipartFile.transferTo(file1);
		
		String result[] =  {filePathName, uploadFileName};
		
		return result;
	}
	
	// 영수증 이미지 삭제 메서드
	public static void removeReceipt(int accountBookNo, String fileName) throws IOException {
		// 서버에서 파일 삭제
		String deletePath = filePath + "receipt/" + accountBookNo + "/";
		String filePath = deletePath + fileName;
		File deleteFile = new File(filePath);
		
		if(deleteFile.exists()) {
            deleteFile.delete(); 
            // System.out.println("파일을 삭제하였습니다.");
        } else {
            System.out.println("파일이 존재하지 않습니다.");
        }
	}
	
	// 게시판 이미지 업로드 메서드
	public static String uploadBoardFile(MultipartFile multipartFile, HttpSession session) throws IOException {
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
		
		String filePathName = uploadPath + storedFileName;
		

		File file1 = new File(filePathName);

		multipartFile.transferTo(file1);
		
		return storedFileName;
	}

	// 게시판 이미지 삭제 메서드
	public static void removeBoardFile(String memberNo, String fileName) throws IOException {
		// 서버에서 파일 삭제
		String deletePath = filePath + "board/" + memberNo + "/";
		String filePath = deletePath + fileName;
		File deleteFile = new File(filePath);
		
		if(deleteFile.exists()) {
            deleteFile.delete(); 
            // System.out.println("파일을 삭제하였습니다.");
        } else {
            System.out.println("파일이 존재하지 않습니다.");
        }
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
