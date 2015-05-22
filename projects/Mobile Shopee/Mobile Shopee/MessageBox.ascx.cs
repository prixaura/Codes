using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class MessageBox : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Literal1.Visible = false;
        Literal1.Text = "";
    }

    public void show(string msg)
    {
        Literal1.Visible = true;
        Literal1.Text = "<script> </script>";
        Literal1.Text = "<div style='width=1px;height=1px' onresize=\"this.style.display='none';alert('" + msg + "');\"/>" +
            "<script language='javascript'> alert('" + msg + "');</script>";
    }

   
}
