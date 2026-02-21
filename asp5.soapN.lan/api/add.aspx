<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";

        string name = null;
        string age  = null;

        if (Request.HttpMethod == "GET") {
            name = Request.QueryString["name"];
            age  = Request.QueryString["age"];
        }
        else if (Request.HttpMethod == "POST") {
            name = Request.Form["name"];
            age  = Request.Form["age"];
        }

        if (name == null || age == null)
        {
            Response.Write("<status>error</status><message>Hiányzó paraméter.</message>");
            return;
        }

        string connStr = System.Configuration.ConfigurationSettings.AppSettings["MyConn"];
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        SqlCommand cmd = new SqlCommand("INSERT INTO legends (name, age) VALUES (@name, @age)", conn);
        cmd.Parameters.Add("@name", System.Data.SqlDbType.NVarChar, 100).Value = name;
        cmd.Parameters.Add("@age", System.Data.SqlDbType.Int).Value            = age;
        cmd.ExecuteNonQuery();
    
        Response.Write("<status>ok</status>");
        Response.Redirect("/");
    }
  
</script>
