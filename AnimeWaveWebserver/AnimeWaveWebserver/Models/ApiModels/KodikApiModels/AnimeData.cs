using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.KodikApiModels;

public class AnimeData
{
        [JsonPropertyName("id")]
        public string Id { get; set; }

        [JsonPropertyName("type")]
        public string Type { get; set; }

        [JsonPropertyName("link")]
        public string Link { get; set; }

        [JsonPropertyName("title")]
        public string Title { get; set; }

        [JsonPropertyName("title_orig")]
        public string TitleOrig { get; set; }

        [JsonPropertyName("other_title")]
        public string OtherTitle { get; set; }

        [JsonPropertyName("translation")]
        public Translation Translation { get; set; }

        [JsonPropertyName("year")]
        public int Year { get; set; }

        [JsonPropertyName("last_season")]
        public int LastSeason { get; set; }

        [JsonPropertyName("last_episode")]
        public int LastEpisode { get; set; }

        [JsonPropertyName("episodes_count")]
        public int EpisodesCount { get; set; }
        
        [JsonPropertyName("kinopoisk_id")]
        public string KinopoiskId { get; set; }
        
        [JsonPropertyName("imdb_id")]
        public string ImdbId { get; set; }
        
        [JsonPropertyName("worldart_link")]
        public string WorldartLink { get; set; }

        [JsonPropertyName("shikimori_id")]
        public string ShikimoriId { get; set; }

        [JsonPropertyName("quality")]
        public string Quality { get; set; }

        [JsonPropertyName("camrip")]
        public bool Camrip { get; set; }

        [JsonPropertyName("lgbt")]
        public bool Lgbt { get; set; }

        [JsonPropertyName("blocked_countries")]
        public List<string> BlockedCountries { get; set; }

        [JsonPropertyName("blocked_seasons")]
        public BlockedSeasons BlockedSeasons { get; set; }

        [JsonPropertyName("created_at")]
        public string CreatedAt { get; set; }

        [JsonPropertyName("updated_at")]
        public string UpdatedAt { get; set; }

        [JsonPropertyName("material_data")]
        public MaterialData MaterialData { get; set; }

        [JsonPropertyName("screenshots")]
        public List<string> Screenshots { get; set; }
}
