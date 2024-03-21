namespace AnimeWaveWebserver.Models.ResponseModels;

public class CalendarData
{
    public List<Preview> Monday { get; set; }
    public List<Preview> Tuesday { get; set; }
    public List<Preview> Wednesday { get; set; }
    public List<Preview> Thursday { get; set; }
    public List<Preview> Friday { get; set; }
    public List<Preview> Saturday { get; set; }
    public List<Preview> Sunday { get; set; }
}