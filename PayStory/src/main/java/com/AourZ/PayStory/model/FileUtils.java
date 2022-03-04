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
	private static final String filePath = "/PayStory/images/"; // 파일이 저장될 위치

	public static String updateImg(MultipartHttpServletRequest mpRequest) throws Exception {

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		String memberImage = "";

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				memberImage = storedFileName;
			}
		}
		return memberImage;
	}

	public static String uploadReceipt(MultipartFile multipartFile, HttpSession session) throws IOException {
		String uploadPath = filePath + "receipt\\";

		File file = new File(uploadPath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		String originalFileName = multipartFile.getOriginalFilename();
		// 업로드 파일 이름 : "memberNo_accountBookNo_파일이름"
		String uploadFileName = session.getAttribute("memberNo") + "_" + session.getAttribute("accountBookNo") + "_"
				+ originalFileName;
		String filePathName = uploadPath + uploadFileName;

		File file1 = new File(filePathName);

		multipartFile.transferTo(file1);

		return filePathName;
	}

	public static String uploadBoardFile(MultipartFile multipartFile, HttpSession session) throws IOException {
		String uploadPath = filePath + "board\\";

		File file = new File(uploadPath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		String originalFileName = multipartFile.getOriginalFilename();
		// 업로드 파일 이름 : "memberNo_accountBookNo_파일이름"
		String uploadFileName = session.getAttribute("memberNo") + "_" + session.getAttribute("boardNo") + "_"
				+ originalFileName;
		String filePathName = uploadPath + uploadFileName;

		File file1 = new File(filePathName);

		multipartFile.transferTo(file1);

		return filePathName;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
