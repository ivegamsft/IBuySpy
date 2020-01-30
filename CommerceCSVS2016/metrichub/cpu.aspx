<%@ Page Language="C#"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Untitled Page</title>
</head>
<body>
<div>
<%
var input = Request.QueryString["cpu"];
if (input == null)
{
input = "100";
}
int percentage;
if (!int.TryParse(input, out percentage) || percentage < 0 || percentage > 100)
throw new ArgumentException("percentage");
var watch = new System.Diagnostics.Stopwatch();
watch.Start();
while (true)
{
// Make the loop go on for "percentage" milliseconds then sleep the
// remaining percentage milliseconds. So 40% utilization means work 40ms and sleep 60ms
if (watch.ElapsedMilliseconds > percentage)
{
System.Threading.Thread.Sleep(100 - percentage);
watch.Reset();
watch.Start();
}
}
%>
</div>
</body>
</html>