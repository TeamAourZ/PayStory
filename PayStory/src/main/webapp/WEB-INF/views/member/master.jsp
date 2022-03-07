<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>PayStory관리자페이지</title>
		
		<%-------- CSS : Bootstrap --------%>
		<link href="<c:url value='/bootstrap/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
	    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	    <link href="<c:url value='/bootstrap/css/sb-admin-2.css'/>" rel="stylesheet">
	    <link href="<c:url value='/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">
		
		<style>
			.control-labell{display: inline-block; margin-bottom: 0.5rem;}
			.row1{display: flex; flex-wrap: wrap; margin-right: 0.8rem; margin-left: 0.8rem;}
			.mb-23{margin-bottom: 0.5rem !important; margin-left: 27px;}
		</style>		
	</head>
	<body>
		<div id="wrapper">
			<%-- Side Bar --%>
			<jsp:include page="/WEB-INF/views/layout/boardSideMenu.jsp" flush="true" />	
			<%-- Content Wrapper --%>
			<div id="content-wrapper" class="d-flex flex-column">
				<%-- Main Content --%>
				<div id="content">
					<%-- Top Menu Bar  --%>
					<jsp:include page="/WEB-INF/views/layout/boardTopMenu.jsp" flush="true" />					
										
					<div class="container-fluid">
					<h1 class="h3 mb-23 text-gray-800">회원정지/해제</h1>
						<div class="row1">					
							<div class="col-lg-6">
                            	<div class="card shadow mb-4">
                                	<div class="card-header py-3">
                                   		<h6 class="m-0 font-weight-bold text-primary">회원정지</h6>
                               		</div>
                                	<div class="card-body">                                    
                                    	<form id="memberSanction" action="/member/memberSanction" method="POST" class="form-signup form-user panel-body"  autocomplete="off">                                         
                   							<div class="form-group">
						                        <label class="control-labell" for="fullName">이메일입력</label>
						                        <input type="text" name="memberEmail" class="form-control input-sm" placeholder="회원정지 이메일입력">
						                        <select name="sanctionTime">
						                        <option value="1">1일</option>
						                        <option value="7">7일</option>
						                        <option value="30">30일</option>
						                        <option value="90">90일</option>
						                        <option value="300">300일</option>
						                        </select>
                    						</div>                   
							                <button class="btn btn-primary btn-block" type="submit" >정지</button>
							            </form>
							         </div>
								</div>
							</div>
							<div class="col-lg-6">
                            	<div class="card shadow mb-4">
                                	<div class="card-header py-3">
                                   		<h6 class="m-0 font-weight-bold text-primary">회원정지해제</h6>
                               		</div>
                                	<div class="card-body">                                    
                                    	<form id="memberSanction" action="/member/memberSanctionCancel" method="POST" class="form-signup form-user panel-body"  autocomplete="off">                                         
                   							<div class="form-group">
						                        <label class="control-labell" for="fullName">이메일입력</label>
						                        <input type="text" name="memberEmail" class="form-control input-sm" placeholder="정지해제 이메일입력">
                    						</div>                   
							                <button class="btn btn-primary btn-block" type="submit" >정지해제</button>
							            </form>
							         </div>
								</div>
							</div>
						</div>					
						<div class="container-fluid">
                    	<h1 class="h3 mb-2 text-gray-800">회원 리스트</h1>
                    	<div class="card shadow mb-4">                       
                        	<div class="card-body">
                            	<div class="table-responsive" style="overflow: hidden;">
                                	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                		<div class="row">
                                			<div class="col-sm-12">                           				
                                					<div class="row">
				                                		<div class="col-sm-12">                               	
				                                			<table class="table table-bordered" id="dataTable">
							                                    <thead>
							                                        <tr>
							                                        	<th>번호</th>
							                                        	<th>회원번호</th>
							                                            <th>Email</th>
							                                            <th>닉네임</th>
							                                            <th>가입일</th>
							                                            <th>권한레벨</th>
							                                            <th>정지기간</th>
							                                        </tr>
							                                    </thead>
							                                    <tbody>
								                                    <c:forEach var="memberList" items="${memberList}" varStatus="status">
							        									<tr class="memberList">
						        											<td><input type="hidden" value='${memberList.memberNo}'/>${status.count}</td>
															        		<td>${memberList.memberNo}</td>
															        		<td>${memberList.memberEmail}</td>
															        		<td>${memberList.memberName}</td>
															        		<td>${memberList.memberJoinDate}</td>
															        		<td>${memberList.memberRank}</td>
															        		<td>${memberList.memberSanctionTime}</td>
																		</tr> 
																	</c:forEach>
							                                    </tbody>
			                                				</table>                                		
                                						</div>
                                					</div>                              					
                                				</div>
                            				</div>
                        				</div>
                    				</div>
               					 </div>				
                			</div>  							
						</div>			
					</div>
					
					<div class="container-fluid">
					<h1 class="h3 mb-23 text-gray-800">관리자권한부여/해제</h1>
						<div class="row1">					
							<div class="col-lg-6">
                            	<div class="card shadow mb-4">
                                	<div class="card-header py-3">
                                   		<h6 class="m-0 font-weight-bold text-primary">관리자권한부여</h6>
                               		</div>
                                	<div class="card-body">                                    
                                    	<form id="memberSanction" action="/member/memberMaster" method="POST" class="form-signup form-user panel-body"  autocomplete="off">                                         
                   							<div class="form-group">
						                        <label class="control-labell" for="fullName">이메일입력</label>
						                        <input type="text" name="memberEmail" class="form-control input-sm" placeholder="권한부여 이메일입력">
                    						</div>                   
							                <button class="btn btn-primary btn-block" type="submit" >권한부여</button>
							            </form>
							         </div>
								</div>
							</div>
							<div class="col-lg-6">
                            	<div class="card shadow mb-4">
                                	<div class="card-header py-3">
                                   		<h6 class="m-0 font-weight-bold text-primary">권한해제</h6>
                               		</div>
                                	<div class="card-body">                                    
                                    	<form id="memberSanction" action="/member/memberMasterCancel" method="POST" class="form-signup form-user panel-body"  autocomplete="off">                                         
                   							<div class="form-group">
						                        <label class="control-labell" for="fullName">이메일입력</label>
						                        <input type="text" name="memberEmail" class="form-control input-sm" placeholder="권한해제 이메일입력">
                    						</div>                   
							                <button class="btn btn-primary btn-block" type="submit" >권한해제</button>
							            </form>
							         </div>
								</div>
							</div>
						</div>		
					</div>	
					<hr>
					<hr>		
					<div class="container-fluid">
					<h1 class="h3 mb-23 text-gray-800">공지사항설정/해제</h1>
						<div class="row1">				
							<div class="col-lg-6">
	                           	<div class="card shadow mb-4">
	                               	<div class="card-header py-3">
	                                  		<h6 class="m-0 font-weight-bold text-primary">공지사항설정</h6>
	                              		</div>
	                               	<div class="card-body">                                    
	                                   	<form id="insertNotice" action="/member/insertNotice" method="POST" class="form-signup form-user panel-body"  autocomplete="off">                                         
	                  							<div class="form-group">
						                        <label class="control-labell" for="fullName">공지사항등록</label>
						                        <input type="text" name="boardNo" class="form-control input-sm" placeholder="게시판번호">
	                   						</div>                   
							                <button class="btn btn-primary btn-block" type="submit" >등록</button>
							            </form>
							         </div>
								</div>
							</div>								
							<div class="col-lg-6">
	                           	<div class="card shadow mb-4">
	                               	<div class="card-header py-3">
	                                  		<h6 class="m-0 font-weight-bold text-primary">공지사항해제</h6>
	                              		</div>
	                               	<div class="card-body">                                    
	                                   	<form id="deleteNotice" action="/member/deleteNotice" method="POST" class="form-signup form-user panel-body"  autocomplete="off">                                         
	                  							<div class="form-group">
						                        <label class="control-labell" for="fullName">공지사항해제</label>
						                        <input type="text" name="boardNo" class="form-control input-sm" placeholder="게시판번호">
	                   						</div>                   
							                <button class="btn btn-primary btn-block" type="submit" >해제</button>
							            </form>
							         </div>
								</div>
							</div>
						</div>
					
					
						<div class="container-fluid">
							<h1 class="h3 mb-23 text-gray-800">공지사항리스트</h1>
	                    	<div class="card shadow mb-4">                       
	                        	<div class="card-body">
	                            	<div class="table-responsive" style="overflow: hidden;">
	                                	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
	                                		<div class="row">
	                                			<div class="col-sm-12">                           				
	                               					<div class="row">
				                                		<div class="col-sm-12">                               	
				                                			<table class="table table-bordered" id="dataTable">
							                                    <thead>
							                                        <tr>
							                                        	<th>게시물번호</th>
							                                            <th>제목</th>
							                                            <th>작성자</th>
							                                            <th>등록시간</th>
							                                        </tr>
							                                    </thead>
							                                    <tbody>
								                                    <c:forEach var="noticeBoardList" items="${noticeBoardList}" varStatus="status">
							        									<tr class="noticeBoardList">
						        											<td>${noticeBoardList.boardNo}</td>
															        		<td>${noticeBoardList.boardTitle}</td>
															        		<td>${noticeBoardList.memberNo}</td>
															        		<td>${noticeBoardList.boardDate}</td>
																		</tr> 
																	</c:forEach>
							                                    </tbody>
			                                				</table>                                		
	                               						</div>
	                               					</div>                              					
	                               				</div>
	                           				</div>
	                       				</div>
	                   				</div>
	              				</div>				
	               			</div>  							
						</div>
						
						<div class="container-fluid">
		                    <h1 class="h3 mb-2 text-gray-800 ml-5">공지사항 작성</h1>
		                    <!-- 게시글 작성 form -->
							<div class="formWrap p-4 bg-white rounded">
								<form id="newBoardForm" class="px-4" action="/board/register" method="post">              		
				              		<div class="form-row">
				              			<!-- 제목 -->
					              		<div class="form-group col-8">
					              			<label>제목</label>
					              			<input class="title form-control shadow-none" name="title">
					              		</div>		              		
				              		</div>
					              	<!-- 내용 -->
				              		<div class="form-group">
					              		<label>내용</label>
					              		<textarea class="content form-control shadow-none" rows="10" name="content"></textarea>
					              	</div>
					              	<div class="d-flex align-items-center justify-content-center mt-3">
										<button type="submit" class="btn btn-primary w-25 mr-3 shadow-none">등록</button>
									</div>
			              		</form>
							</div>
		                </div>							
					</div>		
				</div>
			</div>
		</div>	
	
		<%-------- JS : Bootstrap --------%>
		<script src="<c:url value='/bootstrap/vendor/jquery/jquery.min.js'/>"></script>
	    <script src="<c:url value='/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	    <script src="<c:url value='/bootstrap/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
	    <script src="<c:url value='/bootstrap/js/sb-admin-2.min.js'/>"></script>
	    <script src="<c:url value='/bootstrap/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	    <script src="<c:url value='/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	    <script src="<c:url value='/bootstrap/js/demo/datatables-demo.js'/>"></script>
	</body>
</html>