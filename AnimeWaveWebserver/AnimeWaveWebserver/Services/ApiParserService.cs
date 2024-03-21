using AnimeWaveWebserver.Enums;
using AnimeWaveWebserver.Extentions;
using AnimeWaveWebserver.Interfaces;
using AnimeWaveWebserver.Models.ApiModels.KodikApiModels;
using AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;
using AnimeWaveWebserver.Models.ResponseModels;
using AnimeData = AnimeWaveWebserver.Models.ResponseModels.AnimeData;

namespace AnimeWaveWebserver.Services;

public class ApiParserService: IApiParserService
{
    private readonly IApiService _apiService;
    private HashSet<string> _titles;

    public ApiParserService(IApiService apiService)
    {
        _apiService = apiService;
        _titles = new HashSet<string>();
    }

    public async Task<List<Preview>> GetPreviewsAsync(SortBy sortBy)
    {
        KodikApiResponse? kodikApiResponse;
        var previews = new List<Preview>();
        _titles.Clear();
        if (sortBy == SortBy.Relevant)   kodikApiResponse = await _apiService.GetKodikDataAsync();
        else kodikApiResponse = await _apiService.GetKodikDataSortedByRatingAsync();
        
        foreach (var animeData in kodikApiResponse.Results)
        {
            if (_titles.Contains(animeData.Title)) continue;
            previews.Add(new Preview
            {
                id = animeData.ShikimoriId,
                PosterUrl = animeData.MaterialData.PosterUrl,
                Year = animeData.Year,
                Genres = GetString(animeData.MaterialData.AnimeGenres),
                Rating = animeData.MaterialData.ShikimoriRating,
                Title = animeData.Title
            });
            _titles.Add(animeData.Title);
        }

        return previews;
    }

    public async Task<List<Preview>> GetMorePreviewsAsync(SortBy sortBy)
    {
        KodikApiResponse? kodikApiResponse;
        var previews = new List<Preview>();
        if (sortBy == SortBy.Relevant)   kodikApiResponse = await _apiService.GetMoreKodikDataAsync();
        else kodikApiResponse = await _apiService.GetMoreKodikDataSortedByRatingAsync();
        
        foreach (var animeData in kodikApiResponse.Results)
        {
            if (_titles.Contains(animeData.Title)) continue;
            previews.Add(new Preview
            {
                id = animeData.ShikimoriId,
                PosterUrl = animeData.MaterialData.PosterUrl,
                Year = animeData.Year,
                Genres = GetString(animeData.MaterialData.AnimeGenres),
                Rating = animeData.MaterialData.ShikimoriRating,
                Title = animeData.Title
            });
            _titles.Add(animeData.Title);
        }

        return previews;
    }

    public async Task<CalendarData> GetCalendarDataAsync()
    {
        var shikimoriApiResponse = await _apiService.GetCalendarDataAsync();
        var calendarData = new CalendarData();
        foreach (var data in shikimoriApiResponse)
        {
            var parsedDate = ParseDate(data.NextEpisodeAt);
            switch (parsedDate.dayOfWeek)
            {
                case DayOfWeek.Monday:
                    calendarData.Monday.Add(CreateCalendarPreview(data, parsedDate.nextEpisodeTime));
                    break;
                case DayOfWeek.Tuesday:
                    calendarData.Tuesday.Add(CreateCalendarPreview(data, parsedDate.nextEpisodeTime));
                    break;
                case DayOfWeek.Wednesday:
                    calendarData.Wednesday.Add(CreateCalendarPreview(data, parsedDate.nextEpisodeTime));
                    break;
                case DayOfWeek.Thursday:
                    calendarData.Thursday.Add(CreateCalendarPreview(data, parsedDate.nextEpisodeTime));
                    break;
                case DayOfWeek.Friday:
                    calendarData.Friday.Add(CreateCalendarPreview(data, parsedDate.nextEpisodeTime));
                    break;
                case DayOfWeek.Saturday:
                    calendarData.Saturday.Add(CreateCalendarPreview(data, parsedDate.nextEpisodeTime));
                    break;
                case DayOfWeek.Sunday:
                    calendarData.Sunday.Add(CreateCalendarPreview(data, parsedDate.nextEpisodeTime));
                    break;
            }
            
        }
        calendarData.Sort();
        return calendarData;
    }

    public async Task<AnimeData> GetAnimeDataByIdAsync(string id)
    {
        var kodikApiResponse = await _apiService.GetAnimeDataByIdAsync(id);
        var data = kodikApiResponse.Results.FirstOrDefault();
        
        return new AnimeData
        {
            id = data!.ShikimoriId,
            Title = data.Title,
            PosterUrl = data.MaterialData.PosterUrl,
            Genres = GetString(data.MaterialData.Genres),
            Year = data.Year.ToString(),
            Screenshots = data.MaterialData.Screenshots,
            Status = data.MaterialData.AllStatus,
            Description = data.MaterialData.Description,
            PlayerUrl = data.Link
        };
    }

    public async Task<List<Preview>> GetSearchedPreviewByTitleAsync(string title)
    {
        var kodikApiResponse = await _apiService.SearchAnimeByTitleAsync(title);
        var previews = new List<Preview>();
        
        foreach (var animeData in kodikApiResponse.Results)
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

        return previews;
    }
    
    private string GetString(List<string> list)
    { 
        var result = "";
        if (list.Count == 0) return result;
        foreach (var value in list)
        { 
            result += $"{value}, ";
        }
        return result.Substring(0, result.Length - 2);
    }

    private CalendarPreview CreateCalendarPreview(ShikimoriCalendarApiResponse data, TimeOnly nextEpisodeAt) {
        return new CalendarPreview
        {
            id = data.Anime.Id.ToString(),
            NextEpisodeAt = nextEpisodeAt,
            NextEpisodeNumber = data.NextEpisode,
            PosterUrl = Urls.Shikimori.GetStringValue() + data.Anime.Image.Original,
            Title = data.Anime.Russian
        };
    }

    private (DayOfWeek dayOfWeek, TimeOnly nextEpisodeTime) ParseDate(DateTimeOffset dateTimeOffset) 
        => (dateTimeOffset.DayOfWeek, new TimeOnly(dateTimeOffset.Hour, dateTimeOffset.Minute) );

}