using AnimeWaveWebserver.Models.ApiModels.KodikApiModels;
using AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;

namespace AnimeWaveWebserver.Interfaces;

public interface IApiService
{
    public Task<KodikApiResponse?> GetKodikDataAsync();
    public Task<KodikApiResponse?> GetMoreKodikDataAsync();
    public Task<KodikApiResponse?> GetKodikDataSortedByRatingAsync();
    public Task<KodikApiResponse?> GetMoreKodikDataSortedByRatingAsync();
    public Task<SearchKodikApiResponse?> GetAnimeById(string id);
    public Task<SearchKodikApiResponse?> SearchAnimeByTitleAsync(string title);
    public Task<ShiikmoriCalendarApiResponse?> GetCalendarDataAsync();
}