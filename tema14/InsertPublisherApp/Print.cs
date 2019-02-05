using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsertPublisherApp
{
    class Print
    {
        public static void PrintPublishers()
        {
            SqlConnection connection = new SqlConnection { ConnectionString = "Data Source=DESKTOP-90EKCKC\\Mirela;Initial Catalog=homeworksql3;Integrated Security=True" };
            connection.Open();

            string printPublishers = "select PublisherID, Name from Publisher";
            SqlCommand showPublishers = new SqlCommand(printPublishers);
            showPublishers.Connection = connection;

            SqlDataReader reader = showPublishers.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine($"\t {reader["PublisherID"]} - {reader["Name"]}");
            }
            reader.Close();
            connection.Close();
        }
        public static void PrintBooks()
        {
            SqlConnection connection = new SqlConnection { ConnectionString = "Data Source=DESKTOP-90EKCKC\\Mirela;Initial Catalog=homeworksql3;Integrated Security=True" };

            SqlCommand printBooks = new SqlCommand("select BookID, Title, Year, Price, Name from Book b inner join Publisher p on b.PublisherID=p.PublisherID;");
            printBooks.Connection = connection;
            SqlDataReader reader = printBooks.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine($"\t id: {reader[0]}    title: '{reader[1]}'    year: {reader[2]},    price: {reader[3]} lei,    publisher '{reader[4]}'");
            }
            reader.Close();

            connection.Close();
        }
    }
}
