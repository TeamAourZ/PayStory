package com.AourZ.PayStory.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.AourZ.PayStory.service.ai.ChatbotService;
import com.AourZ.PayStory.service.ai.OCRService;
import com.AourZ.PayStory.service.ai.STTService;
import com.AourZ.PayStory.service.ai.TTSService;

@RestController
public class AIController {
	@Autowired
	private STTService sttService;

	@Autowired
	private TTSService ttsService;

	@Autowired
	private ChatbotService chatbotService;

	@Autowired
	private OCRService ocrService;

	// 챗봇 Form
	@RequestMapping("/chatbotForm")
	public String chatbotForm() {
		return "chatForm";
	}

	// Speech To Text!!
	@RequestMapping("/clovaSTT")
	public String clovaSTT(@RequestParam("uploadFile") MultipartFile file) {
		String result = "";

		try {
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치로 (프로젝트 외부에 저장)
			String uploadPath = "C:/upload/";

			// 2. 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();
			String filePathName = uploadPath + originalFileName;

			// 3. 파일 생성
			File file1 = new File(filePathName);

			// 4. 서버로 전송
			file.transferTo(file1);

			// 서비스에 파일 path와 파일명 전달 -> 서비스 메소드에서 변경
			// 서비스에서 반환된 텍스트를 result에 저장
			result = sttService.clovaSpeechToText(filePathName);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// Speech To Text 2 !!
	@RequestMapping("/clovaSTT2")
	public String clovaSTT2(@RequestParam("uploadFile") MultipartFile file, @RequestParam("language") String language) {
		String result = "";

		try {
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치로 (프로젝트 외부에 저장)
			String uploadPath = "C:/upload/";

			// 2. 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();
			String filePathName = uploadPath + originalFileName;

			// 3. 파일 생성
			File file1 = new File(filePathName);

			// 4. 서버로 전송
			file.transferTo(file1);

			// 서비스에 파일 path와 파일명 전달 -> 서비스 메소드에서 변경
			// 서비스에서 반환된 텍스트를 result에 저장
			result = sttService.clovaSpeechToText2(filePathName, language);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// TextToSpeech !!
	@RequestMapping("/clovaTTS")
	public String clovaTTS(@RequestParam("uploadFile") MultipartFile file, @RequestParam("language") String language) {
		String result = "";

		try {
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치로 (프로젝트 외부에 저장)
			String uploadPath = "C:/upload/";

			// 2. 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();
			String filePathName = uploadPath + originalFileName;

			// 3. 파일 생성
			File file1 = new File(filePathName);

			// 4. 서버로 전송
			file.transferTo(file1);

			// 서비스에 파일 path와 파일명 전달 -> 서비스 메소드에서 변경
			// 서비스에서 반환된 텍스트를 result에 저장
			result = ttsService.clovaTextToSpeech2(filePathName, language);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result; // 저장된 음성 파일명 반환
	}

	// 챗 봇
	@RequestMapping("/chatbot")
	public String chatbot(@RequestParam("message") String message) {
		String result = chatbotService.main(message);
		return result;
	}

	@RequestMapping("/chatbotTTS")
	public String chatbotTTS(@RequestParam("message") String message) {
		String result = ttsService.chatbotTextToSpeech(message);
		return result; // voiceFileName; // 저장된 음성파일 변환
	}

	@RequestMapping("/chatbotImgLink")
	public String chatbotImgLink(@RequestParam("message") String message) {
		String result = chatbotService.imgLinkMainService(message);
		return result; // voiceFileName; // 저장된 음성파일 변환
	}

	/****** OCR *****/
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
