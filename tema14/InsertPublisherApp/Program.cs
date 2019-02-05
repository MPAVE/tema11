using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsertPublisherApp
{
    class Program
    {
        //     Create a console app named InsertPublisherApp to connect to local database.
        //With this console read the name of publisher and insert a new publisher to database.
        //Use SQL parameters for that.
        //Print the inserted id(Execute scalar with select identity)
        public static void InsertPublisher(string publisherName)
        {
            SqlConnection connection = new SqlConnection { ConnectionString = "Data Source=DESKTOP-90EKCKC\\Mirela;Initial Catalog=homeworksql3;Integrated Security=True" };
            connection.Open();

            SqlParameter publisherNameParameter = new SqlParameter();
            publisherNameParameter.Value = publisherName;
            publisherNameParameter.ParameterName = "publisherNameParameter";

            SqlCommand insertPublisher = new SqlCommand();
            insertPublisher.Connection = connection;
            insertPublisher.CommandText = "INSERT INTO Publisher(Name) VALUES(@publisherNameParameter);"
                                         + "SELECT CAST(scope_identity() AS int)";

            insertPublisher.Parameters.Add(publisherNameParameter);

            int inserted = (int)insertPublisher.ExecuteScalar();
            Console.WriteLine($"\n\t Inserted PublisherID: {inserted}");

            connection.Close();
        }
    

        static void Main(string[] args)
        {
                
                Print.PrintPublishers();

                Console.WriteLine("\n\t Insert a new publisher to database");
                Console.WriteLine("\n\t Please enter the name of the Publisher to insert: ");
                Program.InsertPublisher(Console.ReadLine());

                Print.PrintPublishers();

                Console.ReadLine();
            }
    }
}
