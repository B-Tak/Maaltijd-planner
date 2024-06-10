using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;

namespace MaaltijdPlanner
{
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

        public string WeeklyMealPlan { get; set; }

        public void OnGet()
        {
            // Initialize or load any data needed for the page
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            // Handle form submission and use the bound properties
            WeeklyMealPlan = GetWeeklyMeal();
            return Page();
        }

        public static string GetDailyMeal() // placeholder for index
        {
            string placeholder = "First have to setup the weekly meal system";
            return placeholder;
        }

        public string GetWeeklyMeal()
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
}
