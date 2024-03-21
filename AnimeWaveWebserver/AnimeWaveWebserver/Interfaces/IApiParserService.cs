using AnimeWaveWebserver.Enums;
using AnimeWaveWebserver.Models.ResponseModels;

namespace AnimeWaveWebserver.Interfaces;

public interface IApiParserService
{
    public Task<List<Preview>> GetPreviewsAsync(SortBy sortBy);
    public Task<List<Preview>> GetMorePreviewsAsync(SortBy sortBy);
    public Task<CalendarData> GetCalendarDataAsync();
    public Task<AnimeData> GetAnimeDataByIdAsync(string id);
    public Task<List<Preview>> GetSearchedPreviewByTitleAsync(string title);
    public string GetString(List<string> list);
}