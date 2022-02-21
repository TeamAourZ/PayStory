/**
 * mainForum.js
 */

$(function() {
	/* 임시 */
	for (let i = 0; i < 6; i++) {
		$('#homePostBox').append(`
			<div class="d-flex justify-content-around"> <!-- 카테고리 제목 글쓴이 -->
				<div class="forumCategoryName rounded">카테고리 명</div>
				<div class="forumTitle rounded">제목</div>
				<div class="forumWritor rounded">글쓴이</div>
			</div>
		`);
	}
});