using AnimeWaveWebserver.Helpers;

namespace AnimeWaveWebserver.Enums;

public enum RequestParameterNames
{
    [StringValue("token")]
    Token,
    [StringValue("types")]
    Type ,
    [StringValue("with_material_data")]
    WithMaterialData,
    [StringValue("sort")]
    Sort,
    [StringValue("shikimori_id")]
    Id,
    [StringValue("title")]
    Title
    
}