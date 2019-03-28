<%@ page contentType="text/html; charset=Big5" pageEncoding="Big5"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<HTML>
<HEAD>
<TITLE> 查詢員工資料 </TITLE>
<style>

a:visited, a:link {
	color: blue;
	text-decoration: none;
}
a:hover, a:active {
	color: red;
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/font-awesome-4.5.0/css/font-awesome.css">
</HEAD>
<BODY>

<jsp:useBean id="adSvc" scope="page"class="com.ad.model.AdService" />
<%
            Context ctx = new javax.naming.InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CookGodDB");
            Connection con =  ds.getConnection();
            Statement stmt = con.createStatement();
            String theDate = request.getParameter("theDate");
            ResultSet rs = stmt.executeQuery("select to_char(AD_START,'yyyy-mm-dd') AD_START, count(AD_START) as count  from AD where to_char(AD_START,'yyyy-mm-dd')='" + theDate + "' GROUP BY AD_START");
            
            ResultSetMetaData rsmd = rs.getMetaData();
	        int numberOfColumns = rsmd.getColumnCount();
%>
 <a href='<%= request.getRequestURI()%>?theDate=${param.theDate}' target="blank"> 
 <span>
   <% while (rs.next()) { %>
          <i class="fa fa-cog fa-spin fa-1x"></i>
          <b><font size="1px"> <%=rs.getString(1)%> : <%=rs.getString(2)%> 人</font></b>
   <% } %>
 </span>
</a>
<%con.close(); %>

</BODY>
</HTML>