using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.KodikApiModels;

public class SearchKodikApiResponse
{
    [JsonPropertyName("time")]
    public string Time { get; set; }

    [JsonPropertyName("total")]
    public long Total { get; set; }

    [JsonPropertyName("results")]
    public List<AnimeInfo> Results { get; set; }
}