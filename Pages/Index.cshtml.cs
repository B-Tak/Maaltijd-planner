using System;
using System.Globalization;
namespace MaaltijdPlanner;
public class IndexModel
{
    public static string GetDay()
    {
        // I: Obtains the current day, also adds the dutch language.
        DayOfWeek today = DateTime.Today.DayOfWeek;
        CultureInfo dutch = new CultureInfo("nl-NL");
        // I: Translates the English day name into Dutch.
        string dutchDayName = dutch.DateTimeFormat.GetDayName(today);
        return dutchDayName;
    }
}