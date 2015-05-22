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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Cut();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            richTextBox1.Copy();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            richTextBox1.Paste();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            ColorDialog ob = new ColorDialog();
            if (ob.ShowDialog() == DialogResult.OK)
                richTextBox1.SelectionColor = ob.Color;

        }

        private void button5_Click(object sender, EventArgs e)
        {
            richTextBox1.Undo();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            richTextBox1.Redo();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            FontDialog ob = new FontDialog();
            if (ob.ShowDialog() == DialogResult.OK)
                richTextBox1.Font = ob.Font;

        }

        private void button8_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        

    }
}
