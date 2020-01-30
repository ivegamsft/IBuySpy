<%@ Page Language="C#"%>
<%
Response.StatusCode = 403;
Response.ContentType = "text/plain";
Response.Write("Method Not Allowed");
%>

