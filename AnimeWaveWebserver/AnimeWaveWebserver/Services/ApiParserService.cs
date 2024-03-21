using AnimeWaveWebserver.Enums;
using AnimeWaveWebserver.Interfaces;
using AnimeWaveWebserver.Models.ApiModels.KodikApiModels;
using AnimeWaveWebserver.Models.ResponseModels;
using AnimeData = AnimeWaveWebserver.Models.ResponseModels.AnimeData;

namespace AnimeWaveWebserver.Services;

public class ApiParserService: IApiParserService
{
    private readonly IApiService _apiService;
    private HashSet<string> _titles = new HashSet<string>();

    public ApiParserService(IApiService apiService)
    {
        _apiService = apiService;
    }

    public async Task<List<Preview>> GetPreviewsAsync(SortBy sortBy)
    {
        KodikApiResponse? kodikData;
        var previews = new List<Preview>();
        _titles.Clear();
        if (sortBy == SortBy.Relevant)   kodikData = await _apiService.GetKodikDataAsync();
        else kodikData = await _apiService.GetKodikDataSortedByRatingAsync();
        
        foreach (var animeData in kodikData.Results)
        {
            if (!_titles.Contains(animeData.Title))
            {
                previews.Add(new Preview
                {
                    id = animeData.ShikimoriId,
                    PosterUrl = animeData.MaterialData.PosterUrl,
                    Year = animeData.Year,
                    Genres = GetString(animeData.MaterialData.AnimeGenres),
                    Rating = animeData.MaterialData.ShikimoriRating,
                    Title = animeData.Title
                });
            }
        }

        return previews;
    }

    public async Task<List<Preview>> GetMorePreviewsAsync(SortBy sortBy)
    {
        KodikApiResponse? kodikData;
        var previews = new List<Preview>();
        if (sortBy == SortBy.Relevant)   kodikData = await _apiService.GetMoreKodikDataAsync();
        else kodikData = await _apiService.GetMoreKodikDataSortedByRatingAsync();
        
        foreach (var animeData in kodikData.Results)
        {
            if (!_titles.Contains(animeData.Title))
            {
                previews.Add(new Preview
                {
                    id = animeData.ShikimoriId,
                    PosterUrl = animeData.MaterialData.PosterUrl,
                    Year = animeData.Year,
                    Genres = GetString(animeData.MaterialData.AnimeGenres),
                    Rating = animeData.MaterialData.ShikimoriRating,
                    Title = animeData.Title
                });
            }
        }

        return previews;
    }

    public async Task<CalendarData> GetCalendarDataAsync()
    {
        throw new NotImplementedException();
    }

    public async Task<AnimeData> GetAnimeDataByIdAsync(string id)
    {
        throw new NotImplementedException();
    }

    public async Task<List<Preview>> GetSearchedPreviewByTitleAsync(string title)
    {
        throw new NotImplementedException();
    }
    
    public string GetString(List<string> list)
    { 
        var result = "";
        if (list.Count == 0) return result;
        foreach (var value in list)
        { 
            result += $"{value}, ";
        }
        return result.Substring(0, result.Length - 2);
    }
}