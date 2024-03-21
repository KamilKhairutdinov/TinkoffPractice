using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.KodikApiModels;

public class Translation
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("title")]
    public string Title { get; set; }

    [JsonPropertyName("type")]
    public string Type { get; set; }
}