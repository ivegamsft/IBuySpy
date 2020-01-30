<%@ Page Language="C#"%>
<%
Response.StatusCode = 502;
Response.ContentType = "text/plain";
Response.Write("Bad Gateway");
%>

