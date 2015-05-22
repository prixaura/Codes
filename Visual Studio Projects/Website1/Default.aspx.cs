using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            for (int i = 1; i <= 10; i++)
                ListBox2.Items.Add(i.ToString());
        }
    }
    protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListBox1.Items.Clear();
        int i, n, p;
        n = int.Parse(ListBox2.Text);
        for (i = 1; i <= 10; i++)
        {
            p = n * i;
            ListBox1.Items.Add(p.ToString());
        }
    }
}