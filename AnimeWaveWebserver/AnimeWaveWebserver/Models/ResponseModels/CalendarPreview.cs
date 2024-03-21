namespace AnimeWaveWebserver.Models.ResponseModels;

public class CalendarPreview: IComparable<CalendarPreview>
{
    public string id { get; set; }
    public string Title { get; set; }
    public string PosterUrl { get; set; }
    public int NextEpisodeNumber { get; set; }
    public TimeOnly NextEpisodeAt { get; set; }
    
    public int CompareTo(CalendarPreview? other)
    {
        if (other == null) throw new Exception("CalendarPreview CompareTo null exception");
        return NextEpisodeAt.CompareTo(other.NextEpisodeAt);
    }
}