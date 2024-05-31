using MaaltijdPlanner;
using MySql.Data.MySqlClient;

namespace MaaltijdPlanner;

public class Database
{
    private string user = "root";
    private MySqlConnection? conn;

    public Database()
    {
        conn = new MySqlConnection($@"server=localhost;user={user};database=maaltijd_planner");
    }

    public void OpenConnection() 
    {
        try
            {
                conn.Open();
                Console.WriteLine(conn.ServerVersion);
            }
            catch (Exception e)
            {
                Console.WriteLine("MySQL error: " + e.Message);
            }
    }
}