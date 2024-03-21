using AnimeWaveWebserver.Helpers;

namespace AnimeWaveWebserver.Extentions;

public static class EnumExtensions
{
    public static string GetStringValue(this Enum value)
    {
        var type = value.GetType();
        var fieldInfo = type.GetField(value.ToString());
        if (fieldInfo == null) throw new Exception("Enum dont have string value attribute");
        var stringValueAttribute = (StringValueAttribute)fieldInfo.GetCustomAttributes(typeof(StringValueAttribute), false)[0];
        return stringValueAttribute.Value;
    }
}