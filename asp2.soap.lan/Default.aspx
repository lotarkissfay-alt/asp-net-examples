<%@ Page Language="C#" %>

<script runat="server">
  
protected Hashtable GetServerInfo()
{
    Hashtable info          = new Hashtable();
    info["Name"]            = "";
    info["Server"]          = Request.ServerVariables["SERVER_SOFTWARE"];
    info["ASP.NET version"] = Environment.Version.ToString();
    info["Computer Name"]   = Environment.MachineName;
    info["OS version"]      = Environment.OSVersion.ToString();
    info["Current time"]    = DateTime.Now.ToString();
    return info;
}

</script>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="windows-1252">
    <title>ASP.NET 2.</title>
  </head>
  <body bgcolor=fuchsia text=black>
    <font face="Courier New" size="2">
    <p>
      <%
        foreach (DictionaryEntry entry in GetServerInfo())
          Response.Write("<strong>" + entry.Key + ":</strong>" + entry.Value + "<br/>");
      %>
    </p>
  </body>
</html>
