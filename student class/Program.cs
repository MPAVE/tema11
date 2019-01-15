using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace student_class
{
    class Program
    {
        static void Main(string[] args)
        {
            Student student1 = new Student("Popa", "Ion", 1234567891, "Str.AntonPann,Bl.4,Sc.C,Ap.4","+07475777489","PopaIon@gmail.com",2,Speciality.InformaticaEcnomica,Universities.AlexandruIoanCuza,Faculties.Feaa);
            Student student2 = new Student("Gheorghe", "Paul", 1234567890, "Str.AntonPann,Bl.4,Sc.C,Ap.4", "+07475777489", "PaulGh@gmail.com", 2, Speciality.Management, Universities.AlexandruIoanCuza, Faculties.AutomaticasiCalculatoare);

            Student[] students = new Student[] { student1, student2 };
            foreach (var student in students)
            {
                Console.WriteLine(student);
                

            }
            

            //Equals()
            Console.WriteLine(student1.Equals(student2));

            //GetHashCode()
            Console.WriteLine(student1.GetHashCode());
            Console.WriteLine(student2.GetHashCode());
            //== !=
            Console.WriteLine(student1==student2);
            Console.WriteLine(student1!=student2);

            //clone()
            Console.WriteLine("student1 este clonat");
            var student11 = student1.Clone() ;
            //compareto()
            Console.WriteLine();
            Console.WriteLine(student1.CompareTo(student11));

            Console.ReadLine();
        }
    }
}
