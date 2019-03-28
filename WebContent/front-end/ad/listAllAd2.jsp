<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="com.foodSup.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	FoodSupVO foodSupVO = (FoodSupVO) session.getAttribute("foodSupVO");
	AdService adSvc = new AdService();
	List<AdVO> list = adSvc.getAll();
	;pageContext.setAttribute("list", list);
	
	
%>


<!DOCTYPE html>
<html>
<head>
<title>所有廣告資料 </title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 500px;
	background-color: white;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 10px;
	text-align: center;
}
</style>
<style>

/* :: 12.0 Blog Area CSS */
.breadcrumb-area1 {
  position: relative;
  z-index: 1;
  width: 100%;
  height: 380px;
  padding: 0 35px; }
  @media only screen and (min-width: 992px) and (max-width: 1199px) {
    .breadcrumb-area1 {
      height: 300px; } }
  @media only screen and (min-width: 768px) and (max-width: 991px) {
    .breadcrumb-area1 {
      height: 280px; } }
  @media only screen and (max-width: 767px) {
    .breadcrumb-area1 {
      height: 250px; } }
  .breadcrumb-area1::after {
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: -1;
    top: 0;
    left: 0;
    background-color: rgba(163, 163, 163, 0.3); }
  .breadcrumb-area1 .breadcrumb-content {
    text-align: center; }
    .breadcrumb-area1 .breadcrumb-content h2 {
      color: #ffffff;
      font-size: 60px;
      font-weight: 600;
      text-transform: capitalize;
      margin-bottom: 0;
      display: inline-block; }
      @media only screen and (min-width: 992px) and (max-width: 1199px) {
        .breadcrumb-area1 .breadcrumb-content h2 {
          font-size: 42px; } }
      @media only screen and (min-width: 768px) and (max-width: 991px) {
        .breadcrumb-area1 .breadcrumb-content h2 {
          font-size: 36px; } }
      @media only screen and (max-width: 767px) {
        .breadcrumb-area1 .breadcrumb-content h2 {
          font-size: 24px; } }

</style>

</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
	<!-- ##### Breadcrumb Area Start ##### -->
<br>
	  <br>
	   <br>
	    <br>
	 <section class="breadcrumb-area1 bg-img bg-overlay jarallax" style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/foodSupPic.jpg);">
        <div class="container-fluid h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h2 style="font-weight:bold">廣告管理-所有廣告</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Breadcrumb Area End ##### -->

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>廣告編號</th>
			<th>廣告標題</th>
			<th>廣告上架日期</th>
			<th>廣告下架日期</th>
			<th>廣告狀態</th>
			<th>食材供應商</th>
		</tr>
		
		<c:forEach var="adVO" items="${list}" >
			
			<c:if test="${adVO.food_sup_ID == foodSupVO.getFood_sup_ID()}">
			<tr>
				<td>${adVO.ad_ID}</td>
				<td>${adVO.ad_title}</td>
				<td>${adVO.ad_start}</td>
				<td>${adVO.ad_end}</td>
				<td>${adStatusMap[adVO.ad_status]}</td>
				<td>${adVO.food_sup_ID}</td>
			
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ad/ad.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="ad_ID" value="${adVO.ad_ID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				
			</tr>
			</c:if>
		</c:forEach>
	</table>
	

    <!-- ##### Contact Area End #####-->

	<jsp:include page="/froTempl/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>

</body>
</html>