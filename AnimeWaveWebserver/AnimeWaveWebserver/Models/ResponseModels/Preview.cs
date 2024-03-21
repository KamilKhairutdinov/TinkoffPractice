namespace AnimeWaveWebserver.Models.ResponseModels;

public class Preview
{
    public string id { get; set; }
    public string Title { get; set; }
    public string PosterUrl { get; set; }
    public int Year { get; set; }
    public string Genres { get; set; }
    public double Rating { get; set; }
}