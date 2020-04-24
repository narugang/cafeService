<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:forEach var="post" items="${postList}" varStatus="i">
		<div class="card gedf-card" id="postdiv${post.code}">
			<div class="card-header">
				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex justify-content-between align-items-center">
						<div class="mr-2">
							<img class="rounded-circle" width="45"
								src="<c:url value="/"/>${post.thumbimg}" alt="">
						</div>
						<div class="ml-2">
							<input type="hidden" id="postCode${i.count}" name="postcode" value="${post.code}">
							<div id="postsub${post.code}" class="h5 m-0">${post.postsub}</div>
							<div class="h7 text-muted">${post.nic}</div>
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
								<div id="category${post.code}" class="h6 dropdown-header">${post.name}</div>
								<c:if test="${nic eq post.nic or cfmemberAuth eq 0}">
									<a class="dropdown-item" onclick="updatePostForm(${post.code})">수정</a>
									<c:if test="${nic eq post.nic}">
										<a class="dropdown-item" onclick=" deletePost(${post.code})">삭제</a>
									</c:if>
								</c:if>
								<a class="dropdown-item" onclick="boardPrep(${post.code})">신고</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="text-muted h7 mb-2">
					<i class="fa fa-clock-o"></i>${post.writedt} &nbsp;&nbsp; <i class="fa fa-eye"></i>${post.viewcnt}
				</div>
				<a class="card-link" href="#">
				</a>
				<p id="content${post.code}" class="card-text">
					${post.content}
				</p>
			</div>
			<div id ="card-footer${i.count}" class="card-footer">
	        </div>
		</div>
</c:forEach>