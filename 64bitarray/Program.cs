using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _64bit_array
{
    class Program
    {
        static void Main(string[] args)
        {
            BitArray64 arr1 = new BitArray64(4U);
            BitArray64 arr2 = new BitArray64(250U);

            Console.WriteLine(arr1);
            Console.WriteLine(); ;
            Console.WriteLine(arr2);

            Console.WriteLine(arr1==arr2);
            Console.WriteLine();
            Console.WriteLine(arr1.Equals(arr2));
            Console.WriteLine();
            Console.WriteLine(arr1!=arr2);

            Console.WriteLine(arr1.GetHashCode());
            Console.ReadLine();
        }
    }
}
