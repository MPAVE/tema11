using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonClass
{
    class Program
    {
        static void Main(string[] args)
        {
            var Mirela = new Person("Mirela00", 25);
            var Ioana = new Person("Ioana01");
            Console.WriteLine(Mirela);
            Console.ReadLine();
        }
    }
}
