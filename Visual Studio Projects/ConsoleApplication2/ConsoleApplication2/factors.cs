using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication2
{
    public class factors
    {
        public int factorial(int n)
        {
            int s=1;
            for (int i = 1; i <= n; i++)
            {
                s = s * i;
            }

            return s;
        }

    }
}
