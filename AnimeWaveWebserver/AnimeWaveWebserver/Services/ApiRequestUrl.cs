namespace AnimeWaveWebserver.Services;

public enum ApiRequestUrl
{ 
    [StringValue("https://kodikapi.com/search")]
    KodikSearch ,
    [StringValue("https://kodikapi.com/list")]
    KidikList,
    [StringValue("https://shikimori.one/api/calendar")]
    Calendar
}

public class StringValueAttribute : Attribute
{
    public string Value { get; }

    public StringValueAttribute(string value)
    {
        Value = value;
    }
}