using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace student_class
{
    class Student : ICloneable, IComparable
    {
        public Student(string firstname, string lastname, int ssn, string address, string mobile, string email, int course, Speciality specializari, Universities universitati, Faculties facultati)
        {
            this.FirstName = firstname;
            this.LastName = lastname;
            this.SSN = ssn;
            this.Address = address;
            this.Mobile = mobile;
            this.Email = email;
            this.Course = course;
            this.Specializare = specializari;
            this.Universitati = universitati;
            this.Facultati = facultati;

        }


        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int SSN { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public int Course { get; set; }
        public Speciality Specializare { get; set; }
        public Universities Universitati { get; set; }
        public Faculties Facultati { get; set; }

        //Equals()
        public override bool Equals(object obj)
        {
            var objStudent = obj as Student;

            return this.FirstName == objStudent.FirstName;
        }
        //GetHashCode()
        public override int GetHashCode()
        {
            int h = 6;
            h = (h * 6) + this.SSN.GetHashCode();
            return h;
        }
        //tostring()
        public override string ToString()
        {
            var x = new StringBuilder();
            x.Append(string.Format(this.FirstName, this.LastName));
                
            
            return x.ToString();
        }
        //== !=
        public static bool operator ==(Student firstStudent, Student secondStudent)
        {
            return firstStudent.Equals(secondStudent);
        }
        public static bool operator !=(Student firstStudent, Student secondStudent)
        {
            return !(firstStudent == secondStudent);
        }
        //Clone()
        public object Clone()
        {
            Student curentStudent = this;
            Student newStudent = new Student(curentStudent.FirstName, curentStudent.LastName, curentStudent.SSN, curentStudent.Address, curentStudent.Mobile, curentStudent.Email, curentStudent.Course, curentStudent.Specializare, curentStudent.Universitati, curentStudent.Facultati);
            return newStudent;
         }
        //CompareTo()
        public int CompareTo(object obj)
        {
            Student objStudent = obj as Student;
            int c = this.FirstName.CompareTo(objStudent.FirstName);
            if(c==0)
            {
                return this.SSN.CompareTo(objStudent.SSN);
            }
            return c;
        }


    }
    //Enum
        public enum Speciality
        {InformaticaEcnomica,
            Finante,
            Marketing,
            Management,
            Contabilitate
        }

        public enum Universities
        {AlexandruIoanCuza,
            GheorgheAsachi

        }

        public enum Faculties
        {Feaa,
            AutomaticasiCalculatoare

        }

}
