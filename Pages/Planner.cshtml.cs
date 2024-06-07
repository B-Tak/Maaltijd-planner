
using MySql.Data.MySqlClient;
using System.Data;
using System.Globalization;
using System.Text;
namespace MaaltijdPlanner;
public class PlannerModel
{
    private MySqlConnection? conn;
    public static string GetDailyMeal()
    {
        string placeholder = "First have to setup the weekly meal system";
        return placeholder;
    }

    public static string GetWeeklyMeal()
    {
        var conn = new MySqlConnection($@"server=localhost;user=root;database=maaltijdplanner");
        string queryStatement = "SELECT * FROM recipes";
        using(MySqlCommand _cmd = new MySqlCommand(queryStatement, conn))
        {
            DataTable recipes = new DataTable("Recipes");
            MySqlDataAdapter _dap = new MySqlDataAdapter(_cmd);

            conn.Open();
            _dap.Fill(recipes);
            conn.Close();
            
            StringBuilder WeeklyMeals = new StringBuilder();
            foreach(DataRow row in recipes.Rows)
            {
                string? recipeName = row["title"].ToString();

                WeeklyMeals.AppendLine(recipeName);
            }
            return WeeklyMeals.ToString();
        }
    }
}