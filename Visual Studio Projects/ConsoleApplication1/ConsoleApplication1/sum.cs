using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    class sum
    {
        public void sumdigit(int n)
        {
            int s=0;
            for (int i = n; i != 0; i /= 10)
            {
                s = s + (i % 10);
            }

            Console.WriteLine("Sum of the digits of the number: " + s);

        }
    }
}
