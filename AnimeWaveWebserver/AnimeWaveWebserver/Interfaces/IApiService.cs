using AnimeWaveWebserver.Models.ApiModels.KodikApiModels;
using AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;

namespace AnimeWaveWebserver.Interfaces;

public interface IApiService
{
    public Task<KodikApiResponse> GetKodikDataAsync();
    public Task<KodikApiResponse> GetMoreKodikDataAsync();
    public Task<KodikApiResponse> GetKodikDataSortedByRatingAsync();
    public Task<KodikApiResponse> GetMoreKodikDataSortedByRatingAsync();
    public Task<KodikApiResponse> GetAnimeDataByIdAsync(string id);
    public Task<KodikApiResponse> SearchAnimeByTitleAsync(string title);
    public Task<List<ShikimoriCalendarApiResponse>> GetCalendarDataAsync();
}