<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:forEach var="calendarPost" items="${calendarPostList}" varStatus="i">
	<div class="card gedf-card">
		<div class="card-header">
			<div class="d-flex justify-content-between align-items-center">
				<div class="d-flex justify-content-between align-items-center">
					<div class="mr-2">
						<img class="rounded-circle" width="45"
							src="<c:url value="/"/>${calendarPost.thumbimg}" alt="">
					</div>
					<div class="ml-2">
						<input type="hidden" id="calPost${i.count}" value="${calendarPost.calcode}">
						<div class="h5 m-0">${calendarPost.title}</div>
						<div class="h7 text-muted">${calendarPost.nic}</div>
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
							<c:if test="${nic eq calendarPost.nic or authchkResult eq true}">
								<a class="dropdown-item" href="#">수정</a>
							</c:if>
							<c:if test="${nic eq calendarPost.nic}">
								<a class="dropdown-item" href="#">삭제</a>
							</c:if> 
							<a class="dropdown-item" href="#">신고</a>
						</div>
					</div>
				</div>
			</div>
	
		</div>
		<div class="card-body">
			<div class="text-muted h7 mb-2">
				<i class="fa fa-clock-o"></i>작성일: ${calendarPost.writedate} &nbsp;&nbsp; <i class="fa fa-calendar"></i>${calendarPost.calstart} &nbsp; ~ &nbsp; <i class="fa fa-calendar"></i>${calendarPost.end}
			</div>
			<a class="card-link" href="#">
			</a>
	
			<p class="card-text">
				${calendarPost.calcontxt}
			</p>
		</div>
		<div class="card-footer" style="background-color: ${calendarPost.color};">
        </div>
	</div>
</c:forEach>