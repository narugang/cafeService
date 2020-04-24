<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:forEach var="cfmember" items="${cfmemberList}" varStatus="i">
	<div class="card gedf-card">
		<div class="card-header">
			<div class="d-flex justify-content-between align-items-center">
				<div class="d-flex justify-content-between align-items-center">
					<div class="mr-2">
						<img class="rounded-circle" width="45"
							src="<c:url value="/"/>${cfmember.thumbimg}" alt="">
					</div>
					<div class="ml-2">
						<c:if test="${i.last}">
						<input type="hidden" id="cfmemCode" value="${cfmember.cfmem}">
						</c:if>
						<div class="h5 m-0">${cfmember.nic}</div>
						<div class="h7 text-muted">가입일: ${cfmember.regdate}</div>
					</div>
				</div> 
				<div>
					<div class="dropdown">
						<button class="btn btn-link dropdown-toggle" type="button"
							id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i class="fa fa-ellipsis-h"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="gedf-drop1">
							<div class="h6 dropdown-header">
								<c:if test="${cfmember.auth eq 'C1'}">
									관리자
								</c:if>
							</div>
							<c:if test="${nic ne cfmember.nic}">
							<a class="dropdown-item" onclick="requestChattingCfmem(${cfmember.cfmem})">1:1채팅</a>
							</c:if> 
							<a class="dropdown-item" onclick="searchPostCfmem(${cfmember.cfmem})">작성글</a> 
							<a class="dropdown-item">신고</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>