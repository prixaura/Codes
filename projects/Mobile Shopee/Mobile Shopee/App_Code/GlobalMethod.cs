using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public class GlobalMethod
{
    public bool Checklen(string text)
    {
        if ((text.Length == 10) || (text.Length == 12))
        {
            return true;

        }
        else
        {
            return false;
        }
    }
}
