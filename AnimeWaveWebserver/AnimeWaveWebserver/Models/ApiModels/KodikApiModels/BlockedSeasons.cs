using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.KodikApiModels;
public class BlockedSeasons
{
    [JsonPropertyName("5")]
    public string Blocked { get; set; }

    [JsonPropertyName("7")]
    public List<string> BlockedEpisodes { get; set; }
}
