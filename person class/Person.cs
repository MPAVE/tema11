using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonClass
{
    class Person
    { public string Name { get; set; }
        public int? Age { get; set; }
        
    

        public Person(string name, int? age = null)
        {
            this.Name = name;
            this.Age = age;

        }
        public override string ToString()
        {
            var x = new StringBuilder();
            x.Append(string.Format(this.Name, this.Age));
            return x.ToString();
        }
    }
}
