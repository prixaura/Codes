using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication2
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            label1.Text = "0%";

            
            
            progressBar1.Value = progressBar1.Value + 5;
            label1.Text = progressBar1.Value + "%";
            if (progressBar1.Value >= 100)
            {
                timer1.Stop();
                Form1 ob = new Form1();
                ob.Show();
                this.Hide();
            }
        }
    }
}
