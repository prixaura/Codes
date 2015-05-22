using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace ConsoleApplication2
{
    public class reverse
    { 
        private int n,r,s;
        public void input()
        {
            Console.WriteLine("Enter a number");
            n = int.Parse(Console.ReadLine());
        }

        public void calculate()
        {
            for(int i=n;i!=0;i/=10)
            {
                r=i%10;
                s=s*10+r;
            }
        }

        public void output()
        {
            Console.WriteLine("Reverse of the number {0} is: {1}",n,s);
        }

        public int get()
        { return n; }
    }

    
    
    class Program
    {
        static void Main(string[] args)
        {
            reverse ob = new reverse();
            ob.input(); ob.calculate();
            ob.output();
            factors of = new factors();
            int x=of.factorial(ob.get());
            Console.WriteLine("Factorial of the number: " + x);
            Console.ReadLine();

        }
    }
}
