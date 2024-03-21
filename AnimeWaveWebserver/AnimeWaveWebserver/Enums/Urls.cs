using AnimeWaveWebserver.Helpers;

namespace AnimeWaveWebserver.Enums;

public enum Urls
{ 
    [StringValue("https://kodikapi.com/search")]
    KodikSearch ,
    [StringValue("https://kodikapi.com/list")]
    KodikList,
    [StringValue("https://shikimori.one/api/calendar")]
    ShikimoriCalendar,
    [StringValue("https://shikimori.one")]
    Shikimori
}