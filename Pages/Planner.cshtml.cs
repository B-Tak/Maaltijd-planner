using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Ocsp;
using System.Data;

using System.Text;
namespace MaaltijdPlanner;
public class PlannerModel
{
    private int _amountFish;
    private int _amountVegatables;
    private int _amountVegan;

    public HttpResponseMessage Post([FromBody] string value)
    {
        HttpResponseMessage response = new HttpResponseMessage();
        response.Content = new StringContent("Your message to me was: " + value);
        Console.WriteLine(response.Content);
        return response;
    }
    public static string GetDailyMeal()
    {
        string placeholder = "First have to setup the weekly meal system";
        return placeholder;
    }

    public static string GetWeeklyMeal()
    {
        var conn = new MySqlConnection($@"server=localhost;user=root;database=maaltijdplanner");
        string? queryStatement = "SELECT * FROM recipes";
        // I: Query to the database to return all the recipes
        using (MySqlCommand _cmd = new MySqlCommand(queryStatement, conn))
        {
            DataTable recipes = new DataTable("Recipes");
            MySqlDataAdapter _dap = new MySqlDataAdapter(_cmd);

            conn.Open();
            _dap.Fill(recipes);
            conn.Close();

            StringBuilder WeeklyMeals = new StringBuilder();
            foreach (DataRow row in recipes.Rows)
            {
                string? recipeName = row["title"].ToString();

                WeeklyMeals.AppendLine(recipeName);
            }
            return WeeklyMeals.ToString();
        }
    }
}