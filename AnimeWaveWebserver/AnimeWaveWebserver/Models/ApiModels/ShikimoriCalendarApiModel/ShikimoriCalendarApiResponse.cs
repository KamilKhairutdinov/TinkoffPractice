using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;

public class ShikimoriCalendarApiResponse
{
    [JsonPropertyName("next_episode")]
    public int NextEpisode { get; set; }

    [JsonPropertyName("next_episode_at")]
    public DateTimeOffset NextEpisodeAt { get; set; }

    [JsonPropertyName("duration")]
    public int? Duration { get; set; }

    [JsonPropertyName("anime")]
    public Anime Anime { get; set; }
}