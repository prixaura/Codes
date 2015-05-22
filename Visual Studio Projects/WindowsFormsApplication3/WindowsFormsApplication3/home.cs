using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication3
{
    public partial class home : Form
    {
        public home()
        {
            InitializeComponent();
        }

        private void countrycityToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form2 ob = new Form2();
            ob.MdiParent = this;
            ob.Show();
        }

        private void detailsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 ob = new Form1();
            ob.MdiParent = this;
            ob.Show();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void progressBarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            progress ob = new progress();
            ob.MdiParent = this;
            ob.Show();
        }

        private void colorDialogToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form3 ob = new Form3();
            ob.MdiParent = this;
            ob.Show();
        }

        private void detailsToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Summary ob = new Summary();
            ob.MdiParent = this;
            ob.Show();
        }

        
    }
}
