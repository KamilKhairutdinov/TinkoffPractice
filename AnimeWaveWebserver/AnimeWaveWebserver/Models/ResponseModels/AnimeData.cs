namespace AnimeWaveWebserver.Models.ResponseModels;

public class AnimeData
{
    public string id { get; set; }
    public string Title { get; set; }
    public string PosterUrl { get; set; }
    public string Genres { get; set; }
    public int Year { get; set; }
    public List<string> Screenshots { get; set; }
    public string Status { get; set; }
    public string Description { get; set; }
    public string PlayerUrl { get; set; }
}