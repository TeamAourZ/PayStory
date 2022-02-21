package com.AourZ.PayStory.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.AourZ.PayStory.service.OCRService;

@RestController
public class OCRController {
	
	@Autowired
	private OCRService ocrService;
	
	@RequestMapping("/OCR")
	public Map<String, String> ocrUplaod(@RequestParam("expenditureImage") MultipartFile file) throws IOException {
		String uploadPath = "C:/upload/";
		
		String originalFileName = file.getOriginalFilename();
		String filePathName = uploadPath + originalFileName;
		
		File file1 = new File(filePathName);
		
		file.transferTo(file1);
		
		Map<String, String> result = ocrService.clovaOCRService(filePathName);
		// System.out.println(result);
		return result;
	}
}
