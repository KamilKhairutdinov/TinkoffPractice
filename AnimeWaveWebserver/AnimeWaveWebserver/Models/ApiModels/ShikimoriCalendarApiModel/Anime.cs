using System.Net.Mime;
using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;

public class Anime
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("name")]
    public string Name { get; set; }

    [JsonPropertyName("russian")]
    public string Russian { get; set; }

    [JsonPropertyName("image")]
    public ImageData Image { get; set; }

    [JsonPropertyName("url")]
    public string Url { get; set; }

    [JsonPropertyName("kind")]
    public string Kind { get; set; }

    [JsonPropertyName("score")]
    public string Score { get; set; }

    [JsonPropertyName("status")]
    public string Status { get; set; }

    [JsonPropertyName("episodes")]
    public int Episodes { get; set; }

    [JsonPropertyName("episodes_aired")]
    public int EpisodesAired { get; set; }

    [JsonPropertyName("aired_on")]
    public DateTimeOffset AiredOn { get; set; }

    [JsonPropertyName("released_on")]
    public DateTimeOffset? ReleasedOn { get; set; }
}