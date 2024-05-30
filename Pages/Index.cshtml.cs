using System;
using System.Globalization;
namespace MaaltijdPlanner;
public class IndexModel
{
    public static string GetDay()
    {
        DayOfWeek today = DateTime.Today.DayOfWeek;
        string t = today.ToString();
        return t;
    }
}