using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace JsonSerializare
{
    class SerializareXML
    {
        public static void Save(string FileName)
        {
            List<Category> categories1 = new List<Category>();
            Category category1 = new Category()
            {
                CategoryId = 1,
                NameCategory = "Aventura"


            };

            Category category2 = new Category()
            {
                CategoryId = 2,
                NameCategory = "Fantasy"


            };

            categories1.Add(category1);
            categories1.Add(category2);


            using (var writer = new System.IO.StreamWriter(FileName))
            {
                var serializer = new XmlSerializer(categories1.GetType());
                serializer.Serialize(writer, categories1);
                writer.Flush();
            }

        }

        public static List<Category> Load(string FileName)
        {
            using (var stream = System.IO.File.OpenRead(FileName))
            {
                var serializer = new XmlSerializer(typeof(List<Category>));
                return serializer.Deserialize(stream) as List<Category>;
            }
        }


    }
}
    