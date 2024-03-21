using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.KodikApiModels;

public class MaterialData
{
    [JsonPropertyName("title")]
    public string Title { get; set; }

    [JsonPropertyName("anime_title")]
    public string AnimeTitle { get; set; }

    [JsonPropertyName("title_en")]
    public string TitleEn { get; set; }
    
    [JsonPropertyName("other_titles")]
    public List<string> OtherTitles { get; set; }
    
    [JsonPropertyName("other_titles_en")]
    public List<string> OtherTitlesEn { get; set; }

    [JsonPropertyName("other_titles_jp")]
    public List<string> OtherTitlesJp { get; set; }

    [JsonPropertyName("anime_kind")]
    public string AnimeKind { get; set; }

    [JsonPropertyName("all_status")]
    public string AllStatus { get; set; }

    [JsonPropertyName("anime_status")]
    public string AnimeStatus { get; set; }
    
    [JsonPropertyName("year")]
    public int Year { get; set; }
    
    [JsonPropertyName("description")]
    public string Description { get; set; }
    
    [JsonPropertyName("anime_description")]
    public string AnimeDescription { get; set; }

    [JsonPropertyName("poster_url")]
    public string PosterUrl { get; set; }
    
    [JsonPropertyName("screenshots")]
    public List<string> Screenshots { get; set; }
    
    [JsonPropertyName("duration")]
    public int Duration { get; set; }

    [JsonPropertyName("countries")]
    public List<string> Countries { get; set; }

    [JsonPropertyName("all_genres")]
    public List<string> AllGenres { get; set; }
    
    [JsonPropertyName("genres")]
    public List<string> Genres { get; set; }

    [JsonPropertyName("anime_genres")]
    public List<string> AnimeGenres { get; set; }

    [JsonPropertyName("anime_studios")]
    public List<string> AnimeStudios { get; set; }
    
    [JsonPropertyName("imdb_rating")]
    public double ImdbRating { get; set; }
    
    [JsonPropertyName("imdb_votes")]
    public long ImdbVotes { get; set; }

    [JsonPropertyName("shikimori_rating")]
    public double ShikimoriRating { get; set; }

    [JsonPropertyName("shikimori_votes")]
    public long ShikimoriVotes { get; set; }
    
    [JsonPropertyName("premiere_world")]
    public DateTimeOffset? PremiereWorld { get; set; }

    [JsonPropertyName("aired_at")]
    public DateTimeOffset AiredAt { get; set; }

    [JsonPropertyName("next_episode_at")]
    public string NextEpisodeAt { get; set; }

    [JsonPropertyName("rating_mpaa")]
    public string RatingMpaa { get; set; }

    [JsonPropertyName("episodes_total")]
    public int EpisodesTotal { get; set; }

    [JsonPropertyName("episodes_aired")]
    public int EpisodesAired { get; set; }
    
    [JsonPropertyName("actors")]
    public List<string> Actors { get; set; }
    
    [JsonPropertyName("directors")]
    public List<string> Directors { get; set; }

    [JsonPropertyName("producers")]
    public List<string> Producers { get; set; }
    
    [JsonPropertyName("writers")]
    public List<string> Writers { get; set; }
    
    [JsonPropertyName("composers")]
    public List<string> Composers { get; set; }
    
    [JsonPropertyName("editors")]
    public List<string> Editors { get; set; }
    
    [JsonPropertyName("designers")]
    public List<string> Designers { get; set; }
    
    [JsonPropertyName("operators")]
    public List<string> Operators { get; set; }
    
    [JsonPropertyName("kinopoisk_rating")]
    public double KinopoiskRating { get; set; }
    
    [JsonPropertyName("kinopoisk_votes")]
    public long KinopoiskVotes { get; set; }
    
    [JsonPropertyName("released_at")]
    public string ReleasedAt { get; set; }
    
    [JsonPropertyName("anime_license_name")]
    public string AnimeLicenseName { get; set; }
    
    [JsonPropertyName("anime_licensed_by")]
    public List<string> AnimeLicensedBy { get; set; }
    
    [JsonPropertyName("tagline")]
    public string Tagline { get; set; }
    
    [JsonPropertyName("premiere_ru")]
    public DateTimeOffset? PremiereRu { get; set; }
    
    [JsonPropertyName("minimal_age")]
    public int MinimalAge { get; set; }
}