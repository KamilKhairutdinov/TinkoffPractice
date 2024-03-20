using System.Text.Json.Serialization;

namespace AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;

public class ImageData
{
    public partial class Image
    {
        [JsonPropertyName("original")]
        public string Original { get; set; }

        [JsonPropertyName("preview")]
        public string Preview { get; set; }

        [JsonPropertyName("x96")]
        public string X96 { get; set; }

        [JsonPropertyName("x48")]
        public string X48 { get; set; }
    }
}