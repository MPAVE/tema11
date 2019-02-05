using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace JsonSerializare
{
    class SerializarejSON
    {
        public static void Save1(string FileName)
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
            categories1.Add(category2);
            categories1.Add(category1);
            categories1.Add(category2);


            using (var writer = new System.IO.StreamWriter(FileName))
            {

                using (JsonTextWriter jsonWriter = new JsonTextWriter(writer))
                {
                    JsonSerializer ser = new JsonSerializer();
                    ser.Serialize(jsonWriter, categories1);
                    jsonWriter.Flush();
                }
            }

        }

        public static List<Category> Load1(string FileName)
        {
            using (StreamReader reader = new StreamReader(FileName))
            using (JsonTextReader jsonReader = new JsonTextReader(reader))
            {
                JsonSerializer ser = new JsonSerializer();
                return ser.Deserialize(jsonReader) as List<Category>;
            }
        }
    }
}
    