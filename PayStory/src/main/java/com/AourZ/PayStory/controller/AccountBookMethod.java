package com.AourZ.PayStory.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.AourZ.PayStory.model.accountBook.EditorVO;
import com.AourZ.PayStory.model.accountBook.ShareAccountBookVO;
import com.AourZ.PayStory.model.accountBook.TagTotalVO;
import com.AourZ.PayStory.model.member.MemberVO;
import com.AourZ.PayStory.model.member.ShareMemberVO;
import com.AourZ.PayStory.service.accountBook.AccountBookService;

@Repository
public class AccountBookMethod {
	@Autowired
	private AccountBookService accountBookService;

	/* 로그인 정보 확인 */
	boolean sessionCheck(Object obj, HttpServletResponse response) {
		try {
			if (obj == null) {
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();

				out.println("<script>alert('로그인 정보가 정확하지 않습니다.'); location.href='/index';</script>");

				out.flush();
				
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

	/* 숫자 0 채우기 */
	String zeroFill(int num) {
		String text = "";

		if (num < 10) {
			text = "0" + Integer.toString(num);
		} else {
			text = Integer.toString(num);
		}

		return text;
	}

	/* 대시보드 메인 / 조회 - 달력((A / B) / C) : 수입 / 지출 날짜별 총 건수, 총 금액 */
	ArrayList<TagTotalVO> createDataList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<TagTotalVO> resultList = new ArrayList<TagTotalVO>();

		for (int i = 0; i < lastDate; i++) {
			TagTotalVO vo = new TagTotalVO();

			resultList.add(vo);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]) - 1;

			dataList.get(i).setTag(replaceTag("name", dataList.get(i).getTag())); // 태그 번호 to 태그 이름

			resultList.set(day, dataList.get(i));
		}

		return resultList;
	}

	/* 대시보드 메인 - 달력(A / B) : 수입 / 지출 날짜별 태그별 총 건수, 총 금액 */
	ArrayList<ArrayList<TagTotalVO>> createDetailDataList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<ArrayList<TagTotalVO>> resultItemList = new ArrayList<ArrayList<TagTotalVO>>();

		for (int i = 0; i < lastDate; i++) {
			ArrayList<TagTotalVO> voArray = new ArrayList<TagTotalVO>();

			resultItemList.add(voArray);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]) - 1;

			dataList.get(i).setTag(replaceTag("name", dataList.get(i).getTag())); // 태그 번호 to 태그 이름

			resultItemList.get(day).add(dataList.get(i));
		}

		return resultItemList;
	}

	/* 소유자, 참여자 정보 조회 */
	ArrayList<ShareMemberVO> selectShareMemberInfoList(int accountBookNo) {
		// 소유자, 참여자 조회
		ArrayList<ShareAccountBookVO> tempList = accountBookService.selectShareMemberList(accountBookNo);

		// 소유자, 참여자 리스트
		ArrayList<ShareMemberVO> shareMemberInfoList = new ArrayList<ShareMemberVO>();

		boolean isOwner = false; // 소유자 리스트 추가 유무
		String memberNo = ""; // 회원 번호

		for (int i = 0; i < tempList.size(); i++) {
			if (isOwner == false) {
				memberNo = tempList.get(i).getOwner();

				isOwner = true;
				i -= 1;
			} else {
				memberNo = tempList.get(i).getParticipant();
			}

			MemberVO member = accountBookService.selectMemberInfo("memberNo", memberNo);

			ShareMemberVO vo = new ShareMemberVO();

			vo.setMemberNo(memberNo);
			vo.setMemberName(member.getMemberName());
			vo.setMemberEmail(member.getMemberEmail());
			vo.setMemberImage(member.getMemberImage());

			shareMemberInfoList.add(vo);
		}

		return shareMemberInfoList;
	}

	/* 수정자 조회 */
	Map<Integer, ArrayList<EditorVO>> selectEditorList(String condition, int accountBookNo, String date) {
		ArrayList<Integer> editDataNoList = accountBookService.selectEditorDataNoList(condition, accountBookNo, date);

		Map<Integer, ArrayList<EditorVO>> editorList = new HashMap<Integer, ArrayList<EditorVO>>();

		for (int i = 0; i < editDataNoList.size(); i++) {
			ArrayList<EditorVO> temp = accountBookService.selectEditorList(condition, accountBookNo,
					editDataNoList.get(i));

			for (int j = 0; j < temp.size(); j++) {
				temp.get(j).setMember(replaceMember("name", temp.get(j).getMember())); // 회원 번호 to 회원 이름
			}

			if (temp != null && temp.size() > 0) {
				editorList.put(editDataNoList.get(i), temp);
			}
		}

		return editorList;
	}

	/* 회원 번호 to 회원 @ */
	String replaceMember(String condition, String memberNo) {
		MemberVO memberInfo = accountBookService.selectMemberInfo("memberNo", memberNo);

		String result = "";

		if (condition.equals("name")) {
			result = memberInfo.getMemberName();
		} else if (condition.equals("email")) {
			result = memberInfo.getMemberEmail();
		}

		return result;
	}

	/* 태그 번호 to 태그 이름 */
	String replaceTag(String condition, String tag) {
		String result = accountBookService.selectTagInfo(condition, tag);

		return result;
	}

	/* 카테고리 번호 to 카테고리 이름 */
	String replaceCategory(String categoryNo) {
		String categoryName = accountBookService.selectBoardCategoryName(categoryNo);

		return categoryName;
	}

}
