<%@ Page Language="C#" %>

<script runat="server">

  Random rnd = new Random();

  void Page_Load(object sender, EventArgs e) {
    if (Session["number"] == null)
      Session["number"] = rnd.Next(1, 101);
  }

  void Test_Click(object sender, EventArgs e) {
    int number = (int)Session["number"];
    int guess  = Convert.ToInt32(edGuess.Text);

    if (guess < number)
      lbResult.Text = "I picked a larger number!";
    else if (guess > number)
      lbResult.Text = "I picked a smaller number!";
    else {
      lbResult.Text = "You nailed it, congrats!";
      Session["number"] = rnd.Next(1, 101);
    }
  }

</script>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="windows-1252">
    <title>ASP.NET 3.</title>
  </head>
  <body bgcolor=maroon text=white>
    <font face="Tahoma" size="2">
    <h1 align="center">I&#39;m thinking of a number...</h1>
    <marquee>Guess the number I picked from 1 to 100!</marquee>
    <form runat="server">
      <asp:TextBox id="edGuess"  runat="server"/>
      <asp:Button  id="btnTest"  Text="Check" OnClick="Test_Click" runat="server"/>
      <br/><br/>
      <asp:Label   id="lbResult" runat="server"/>
    </form>
  </body>
</html>
