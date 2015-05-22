using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Calculator : Form
    {
        int first, second, ans; char op;
        public Calculator()
        {
            InitializeComponent();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            second=int.Parse(textBox1.Text);
            if (op=='+')
                ans = ans + second;
            if (op=='-')
                ans = ans - second;
            if (op=='*')
                ans = ans * second;
            if (op=='/')
                ans = ans / second;
            textBox1.Text=ans.ToString();
            textBox1.Focus();
            

        }


        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text += "1";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text += "2";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Text += button3.Text;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            textBox1.Text += "4";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox1.Text += "5";
        }

        private void button6_Click(object sender, EventArgs e)
        {
            textBox1.Text += "6";
        }

        private void button7_Click(object sender, EventArgs e)
        {
            textBox1.Text += "7";
        }

        private void button8_Click(object sender, EventArgs e)
        {
            textBox1.Text += "8";
        }

        private void button9_Click(object sender, EventArgs e)
        {
            textBox1.Text += "9";
        }

        private void button12_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
        }

        private void button13_Click(object sender, EventArgs e)
        {
            first = int.Parse(textBox1.Text);
            textBox1.Text="";
            ans= ans+first;
            op = '+';
            textBox1.Focus();
        }

        private void button14_Click(object sender, EventArgs e)
        {
            first = int.Parse(textBox1.Text);
            textBox1.Text = "";
            ans= ans- first;
            op = '-';
            textBox1.Focus();
        }

        private void button15_Click(object sender, EventArgs e)
        {
            first = int.Parse(textBox1.Text);
            textBox1.Text = "";
            ans = ans*first;
            op = '*';
            textBox1.Focus();
        }

        private void button16_Click(object sender, EventArgs e)
        {
            first = int.Parse(textBox1.Text);
            textBox1.Text = "";
            ans=ans/first;
            op = '/';
            textBox1.Focus();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox1.Focus();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            textBox1.Text += "0";
        }
    }
}
