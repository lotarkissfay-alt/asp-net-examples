<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";

        string connStr = System.Configuration.ConfigurationSettings.AppSettings["MyConn"];
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        SqlCommand cmd = new SqlCommand("INSERT INTO legends (name, age) VALUES (@name, @age)", conn);
        cmd.Parameters.Add("@name", System.Data.SqlDbType.NVarChar, 100).Value = Request.Form["name"];
        cmd.Parameters.Add("@age", System.Data.SqlDbType.Int).Value = Request.Form["age"];
        cmd.ExecuteNonQuery();
    
        Response.Write("<status>ok</status>");
        Response.Redirect("/");
    }
  
</script>
