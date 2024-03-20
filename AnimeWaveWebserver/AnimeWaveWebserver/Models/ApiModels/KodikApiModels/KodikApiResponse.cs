using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.KodikApiModels;

public class KodikApiResponse
{
    [JsonPropertyName("time")]
    public string Time { get; set; }

    [JsonPropertyName("total")]
    public long Total { get; set; }

    [JsonPropertyName("prev_page")]
    public string PrevPage { get; set; }

    [JsonPropertyName("next_page")]
    public string NextPage { get; set; }

    [JsonPropertyName("results")]
    public List<AnimeInfo> Results { get; set; }
}

