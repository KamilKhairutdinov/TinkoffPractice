using AnimeWaveWebserver.Helpers;

namespace AnimeWaveWebserver.Enums;

public enum RequestParameterValues
{
    [StringValue("6af87a3c4d118b257f00be5d8e5a976d")]
    Token,
    [StringValue("anime-serial")]
    TypeAnimeSerial ,
    [StringValue("true")]
    WithMaterialData,
    [StringValue("shikimori_rating")]
    Sort
}