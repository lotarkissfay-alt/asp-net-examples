<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

  //Response.Write(System.Security.Principal.WindowsIdentity.GetCurrent().Name);
  
  SqlDataReader sqlQuery() {
    string connStr = System.Configuration.ConfigurationSettings.AppSettings["MyConn"];
    
    SqlConnection conn = new SqlConnection(connStr);
    conn.Open();

    SqlCommand cmd = new SqlCommand("SELECT * FROM legends", conn);
    return cmd.ExecuteReader();
  }

</script>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="windows-1252">
    <title>ASP.NET 4.</title>
  </head>
  <body bgcolor=olive text=white>
    <font face="Comic Sans MS" size="2">
    <h1 align="center">The legends of this gym</h1>
    <table align="center" bgcolor=black width=80% border=1>
      <tr>
        <td align="center" bgcolor=maroon><strong>The legend&#39;s name</strong></td>
        <td align="center" bgcolor=maroon><strong>Age when became top</strong></td>
      </tr>
      <%
        SqlDataReader reader = sqlQuery();
        while (reader.Read()) 
        {
            Response.Write(
              "<tr><td align=\"center\">" +
              reader["name"] +
              "</tr><td align=\"center\">" +
              reader["age"] +
              "</td></tr>"
            );
        }
      %>
    </table>
    <br/>
    <marquee>Be the king of the gym like they were!</marquee>
  </body>
</html>
