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
    public partial class Form2 : Form
    {
        SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=J:\documents\projects\WindowsFormsApplication3\WindowsFormsApplication3\Database2.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        SqlCommand cmd;
        SqlDataReader dr;
        
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("select countryname from country", cn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
                comboBox1.Items.Add(dr[0].ToString());
            cn.Close(); comboBox1.Text = "------select a country------";
        }
        

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBox2.Items.Clear();
            cn.Open();
            cmd=new SqlCommand("select cityname from city where cityid=(select countryid from country where countryname='"+comboBox1.Text+"')",cn);
            dr = cmd.ExecuteReader();
            while (dr.Read())
                comboBox2.Items.Add(dr[0].ToString());
            cn.Close();
            comboBox2.Text = "------select a city------";

        }
    }
}
