<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div id="postDivUpd" class="card-body">
	<div class="writeFormBox">
			<!-- Text input-->
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" for="postsubUpd">제목</label>
				<div class="col-sm-10">
				<input id="postcdUpd" name="postcd" type="hidden">
					<input id="postsubUpd" name="postsub" type="text" class="form-control" value="${post.postsub}">
				</div> 
			</div>
			<!-- Select Basic -->
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" for="categoryUpd">카테고리</label>
				<div class="col-sm-10">
					<select id="categoryUpd" name="category" class="custom-select mr-sm-2" is="">
						<c:forEach var="category" items="${categoryList}">
							<option <c:if test="${category.code eq post.category}">selected</c:if> value="${category.code}">${category.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- Textarea -->
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" for="contentUpd">글내용</label>
				<div class="col-sm-10">
					<textarea id="contentUpd" class="form-control" name="content" >${post.content}</textarea>
				</div>
			</div>
			<!-- Button (Double) -->
			<div class="form-group row">
				<label class="col-sm-2 col-form-label" for="buttonUpd"></label>
				<div id="buttonUpd" class="col-sm-10">
					<button class="btn btn-success" onclick="updatePost()">수정</button>
					<button class="btn btn-danger" onclick="updateClose()">취소</button>
				</div>
			</div>
	</div>
</div>