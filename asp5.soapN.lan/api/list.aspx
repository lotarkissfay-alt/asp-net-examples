<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Xml" %>

<script runat="server">

  void Page_Load(object sender, EventArgs e)
  {
    Response.ContentType = "text/xml";
    XmlTextWriter xml = new XmlTextWriter(Response.OutputStream, null);
    xml.WriteStartDocument();
    xml.WriteStartElement("legends");

    string connStr = System.Configuration.ConfigurationSettings.AppSettings["MyConn"];
    SqlConnection conn = new SqlConnection(connStr);
    conn.Open();

    SqlCommand cmd = new SqlCommand("SELECT * FROM legends", conn);
    SqlDataReader reader = cmd.ExecuteReader();
    
    while (reader.Read())
    {
        xml.WriteStartElement("legend");
        xml.WriteElementString("id", reader["id"].ToString());
        xml.WriteElementString("name", reader["name"].ToString());
        xml.WriteElementString("age", reader["age"].ToString());
        xml.WriteEndElement();
    }
    reader.Close();

    xml.WriteEndElement();
    xml.WriteEndDocument();
    xml.Flush();
  }
  
</script>
