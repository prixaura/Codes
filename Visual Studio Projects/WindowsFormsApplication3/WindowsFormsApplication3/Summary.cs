using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApplication3
{
    public partial class Summary : Form
    {
        SqlConnection cn=new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=J:\documents\projects\WindowsFormsApplication3\WindowsFormsApplication3\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        SqlDataAdapter adp;
        DataSet ds = new DataSet();
        static int current = 0, maxrows; DataTable dt;
        public Summary()
        {
            InitializeComponent();
        }

        private void Summary_Load(object sender, EventArgs e)
        {
            adp = new SqlDataAdapter("select * from details", cn);
            adp.Fill(ds, "n");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                listBox1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
            dt = ds.Tables["n"];
            maxrows = dt.Rows.Count;
            fill_control();

        }

        public void fill_control()
        {
            textBox1.Text = dt.Rows[current][0].ToString();
            textBox2.Text = dt.Rows[current][1].ToString();
            textBox3.Text = dt.Rows[current][2].ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            current = 0;
            fill_control();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            current = maxrows - 1;
            fill_control();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            current--;
            if (current < 0)
                current = 0;
            fill_control();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            current++;
            if (current >= maxrows)
                current = maxrows - 1;
            fill_control();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }


    }
}
