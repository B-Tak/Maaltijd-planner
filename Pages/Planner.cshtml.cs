using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Text;

namespace MaaltijdPlanner
{
    [ValidateAntiForgeryToken]
    public class PlannerModel : PageModel
    {
        // Properties for binding form values
        [BindProperty]
        public int Days { get; set; }

        [BindProperty]
        public int Random { get; set; }

        [BindProperty]
        public int Vis { get; set; }

        [BindProperty]
        public int Avg { get; set; }

        [BindProperty]
        public int Ongezond { get; set; }

        [BindProperty]
        public int Vegan { get; set; }

        // Property to hold the weekly meals data
        public string WeeklyMeals { get; set; }

        public void OnGet()
        {
            // Initialize or load any data needed for the page
        }

        public IActionResult OnPost()
        {
            // Debugging: Check form values
            Console.WriteLine($"Days: {Days}");
            Console.WriteLine($"Random: {Random}");
            Console.WriteLine($"Vis: {Vis}");
            Console.WriteLine($"Avg: {Avg}");
            Console.WriteLine($"Ongezond: {Ongezond}");
            Console.WriteLine($"Vegan: {Vegan}");

            // fetch the weakly meals from the form values and set the WeeklyMeals property
            WeeklyMeals = GetWeeklyMeal();

            // Assuming you want to refresh the page after form submission
            return RedirectToPage();
        }

        public static string GetDailyMeal() // placeholder for index
        {
            string placeholder = "First have to setup the weekly meal system";
            return placeholder;
        }

        public string GetWeeklyMeal()
        {
            var conn = new MySqlConnection($@"server=localhost;user=root;database=maaltijdplanner");
            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM recipes WHERE 1=1");

            if (Vis > 0) queryBuilder.Append(" OR Fish = 1");
            if (Avg > 0) queryBuilder.Append(" OR Vegetables = 1");
            if (Vegan > 0) queryBuilder.Append(" OR Vegan = 1");
            if (Ongezond > 0) queryBuilder.Append(" OR Unhealthy = 1");

            string queryStatement = queryBuilder.ToString();

            Console.WriteLine($"Executing Query: {queryStatement}"); // Log the query

            // Query the database to return all the recipes
            using (MySqlCommand _cmd = new MySqlCommand(queryStatement, conn))
            {
                DataTable recipes = new DataTable("Recipes");
                MySqlDataAdapter _dap = new MySqlDataAdapter(_cmd);

                conn.Open();
                _dap.Fill(recipes);

                StringBuilder WeeklyMeals = new StringBuilder();
                foreach (DataRow row in recipes.Rows)
                {
                    string? recipeName = row["title"].ToString();

                    WeeklyMeals.AppendLine(recipeName);
                    Console.WriteLine($"Weekly Meals Fetched: {recipeName}");
                }
                conn.Close();
                return WeeklyMeals.ToString();
            }
        }
    }
}
