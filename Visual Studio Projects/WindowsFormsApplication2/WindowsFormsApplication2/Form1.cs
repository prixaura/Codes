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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00062.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00063.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00064.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00065.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00066.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00067.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00068.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00069.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00070.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00071.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00072.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00073.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00074.jpg");
            listBox1.Items.Add(@"J:\pictures\New folder\DSC00075.jpg");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            pictureBox1.Image = Image.FromFile(listBox1.Text);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;

        }

        private void button2_Click(object sender, EventArgs e)
        {
            OpenFileDialog ob = new OpenFileDialog();
            if (ob.ShowDialog() == DialogResult.OK)
            {
                string file = ob.FileName;
                pictureBox1.Image = Image.FromFile(file);
                pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            ColorDialog ob = new ColorDialog();
            if (ob.ShowDialog() == DialogResult.OK)
                this.BackColor = ob.Color;
        }

        
    }
}
