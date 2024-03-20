using AnimeWaveWebserver.Interfaces;
using AnimeWaveWebserver.Models.ApiModels.KodikApiModels;
using AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;

namespace AnimeWaveWebserver.Services;

public class ApiService: IApiService
{
    public Task<KodikApiResponse?> GetKodikDataAsync()
    {
        throw new NotImplementedException();
    }

    public Task<KodikApiResponse?> GetMoreKodikDataAsync()
    {
        throw new NotImplementedException();
    }

    public Task<KodikApiResponse?> GetKodikDataSortedByRatingAsync()
    {
        throw new NotImplementedException();
    }

    public Task<KodikApiResponse?> GetMoreKodikDataSortedByRatingAsync()
    {
        throw new NotImplementedException();
    }

    public Task<SearchKodikApiResponse?> GetAnimeById(string id)
    {
        throw new NotImplementedException();
    }

    public Task<SearchKodikApiResponse?> SearchAnimeByTitleAsync(string title)
    {
        throw new NotImplementedException();
    }

    public Task<ShiikmoriCalendarApiResponse?> GetCalendarDataAsync()
    {
        throw new NotImplementedException();
    }
}