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
    public partial class Form1 : Form
    {
        SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=J:\documents\projects\WindowsFormsApplication3\WindowsFormsApplication3\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        SqlCommand cmd;
        SqlDataReader dr;
        
        
        
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("select * from details",cn);
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                //listBox2.Items.Add(dr[1].ToString());
                //listBox3.Items.Add(dr[2].ToString());
                
                listBox1.Items.Add(dr[0].ToString());
            }
            cn.Close();
        }

       
            

        private void button1_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("select * from details where id=" + listBox1.Text + " ", cn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                textBox1.Text = dr[0].ToString();
                textBox2.Text = dr[1].ToString();
                textBox3.Text = dr[2].ToString();
            }
            cn.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("insert into details values(" + textBox1.Text + ",'" + textBox2.Text + "'," + textBox3.Text + ")", cn);
            int i;
            i = cmd.ExecuteNonQuery();
            if (i > 0)
                MessageBox.Show("Data successfully entered");
            else
                MessageBox.Show("Insertion failed");
            listBox1.Items.Clear();
            cmd = new SqlCommand("select * from details", cn);
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                //listBox2.Items.Add(dr[1].ToString());
                //listBox3.Items.Add(dr[2].ToString());

                listBox1.Items.Add(dr[0].ToString());
            }


            cn.Close();
        }

        

        private void button4_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("update details set id=" + textBox1.Text + ",name='" + textBox2.Text + "',salary=" + textBox3.Text + " where id=" + listBox1.Text + " ", cn);
            listBox1.Items.Clear();

            
            cmd = new SqlCommand("select * from details", cn);
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                //listBox2.Items.Add(dr[1].ToString());
                //listBox3.Items.Add(dr[2].ToString());

                listBox1.Items.Add(dr[0].ToString());
            }
            cn.Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox1.Focus();
        }





        
    }
}
