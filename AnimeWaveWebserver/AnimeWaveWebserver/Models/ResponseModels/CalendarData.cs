namespace AnimeWaveWebserver.Models.ResponseModels;

public class CalendarData
{
    public List<CalendarPreview> Monday { get; set; }
    public List<CalendarPreview> Tuesday { get; set; }
    public List<CalendarPreview> Wednesday { get; set; }
    public List<CalendarPreview> Thursday { get; set; }
    public List<CalendarPreview> Friday { get; set; }
    public List<CalendarPreview> Saturday { get; set; }
    public List<CalendarPreview> Sunday { get; set; }

    public CalendarData()
    {
        Monday = new List<CalendarPreview>();
        Tuesday = new List<CalendarPreview>();
        Wednesday = new List<CalendarPreview>();
        Thursday = new List<CalendarPreview>();
        Friday = new List<CalendarPreview>();
        Saturday = new List<CalendarPreview>();
        Sunday = new List<CalendarPreview>();
    }

    public void Sort()
    {
        Monday.Sort();
        Tuesday.Sort();
        Wednesday.Sort();
        Thursday.Sort();
        Friday.Sort();
        Saturday.Sort();
        Sunday.Sort();
    }
}