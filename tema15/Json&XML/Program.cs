using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace JsonSerializare
{
    class Program
    {
        static void Main(string[] args)
        {
            PrintDataFromXMLFile("Text.txt");


            Console.ReadKey();


        }

        public static void PrintDataFromXMLFile(string fileName)
        {
            var listFromXMLFile = SerializareXML.Load(fileName);
            foreach (var category in listFromXMLFile)
            {
                Console.WriteLine($"{category.CategoryId}, {category.NameCategory}");
            }
        }
    }
}
     