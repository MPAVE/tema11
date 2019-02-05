using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SummaryPublisherApp
{
    class Program
    {
        static void Main(string[] args)
        {
            SqlConnection connection1 = new SqlConnection{ConnectionString = "Data Source=DESKTOP-90EKCKC\\Mirela;Initial Catalog=homeworksql3;Integrated Security=True" };
        connection1.Open();
            SqlConnection connection2 = new SqlConnection { ConnectionString = "Data Source=DESKTOP-90EKCKC\\Mirela;Initial Catalog=homeworksql3;Integrated Security=True" };
            connection2.Open();
            SqlConnection connection3 = new SqlConnection { ConnectionString = "Data Source=DESKTOP-90EKCKC\\Mirela;Initial Catalog=homeworksql3;Integrated Security=True" };
            connection3.Open();
            SqlConnection connection4 = new SqlConnection { ConnectionString = "Data Source=DESKTOP-90EKCKC\\Mirela;Initial Catalog=homeworksql3;Integrated Security=True" };
            connection4.Open();

            Program.NrRowsOnPublish(connection1);
            Program.NumbersOfBooksPerEachPublisher(connection2);
            Program.TotalPriceForBooksForAPublisher(connection3);
            Program.Top10Publishers(connection4);
            Console.ReadKey();

        }
        private static void NrRowsOnPublish(SqlConnection connection1)
        {
            SqlCommand command1 = new SqlCommand("Select Count(*) from Publisher", connection1);

            int Number = (int)command1.ExecuteScalar();

            Console.WriteLine(Number);

            connection1.Close();
        }


        private static void Top10Publishers(SqlConnection connection2)
        {
            SqlCommand command2 = new SqlCommand("Select Top 10 * from Publisher order by PublisherID ", connection2);

            SqlDataReader reader = command2.ExecuteReader();

            while (reader.Read())
            {
                string rows = $"{reader["PublisherId"]} , {reader["Name"]}";
                Console.WriteLine(rows);
            }


            connection2.Close();
        }

        private static void NumbersOfBooksPerEachPublisher(SqlConnection connection3)
        {
            SqlCommand command3 = new SqlCommand("select COUNT(b.BookID), p.Name " +
                "from Book b inner join Publisher p on b.PublisherID=p.PublisherID " +
                "group by p.Name;", connection3);

            SqlDataReader reader = command3.ExecuteReader();

            while (reader.Read())
            {
                string rows = $"{reader["Name"]} , {reader["NumberOfBooks"]}";
                Console.WriteLine(rows);
            }
            connection3.Close();
        }
        private static void TotalPriceForBooksForAPublisher(SqlConnection connection4)
        {
            SqlCommand command4 = new SqlCommand("select SUM(b.Price), p.Name " +
                "from Book b inner join Publisher p on b.PublisherID=p.PublisherID " +
                "group by p.Name;", connection4);

            SqlDataReader reader = command4.ExecuteReader();

            while (reader.Read())
            {
                string rows = $"{reader[0]} , {reader[1]}";
                Console.WriteLine(rows);
            }

            connection4.Close();
        }

       


      
    }
}
   