using System.Text.Json;
using AnimeWaveWebserver.Enums;
using AnimeWaveWebserver.Extentions;
using AnimeWaveWebserver.Interfaces;
using AnimeWaveWebserver.Models.ApiModels.KodikApiModels;
using AnimeWaveWebserver.Models.ApiModels.ShikimoriCalendarApiModel;
using RestSharp;

namespace AnimeWaveWebserver.Services;

public class ApiService: IApiService
{
    private string _nextUrlRequest = "";
    private string _nextUrlRequestPopular = "";
    
    public async Task<KodikApiResponse> GetKodikDataAsync()
    {
        var client = new RestClient(Urls.KodikList.GetStringValue());
        var request = new RestRequest
        {
            Method = Method.Get,
        };
        
        request.AddHeader("Accept", "application/json");
        request.AddHeader("Content-Type", "application/json");

        request.AddParameter(RequestParameterNames.Token.GetStringValue(), RequestParameterValues.Token.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.Type.GetStringValue(), RequestParameterValues.TypeAnimeSerial.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.WithMaterialData.GetStringValue(), RequestParameterValues.WithMaterialData.GetStringValue(), ParameterType.QueryString);
        
        var response = await client.ExecuteAsync(request);
        if (response.Content == null) throw new Exception("GetKodikDataAsync content is null");
        
        var kodikApiResponse = JsonSerializer.Deserialize<KodikApiResponse>(response.Content);
        _nextUrlRequest = kodikApiResponse!.NextPage;
        return kodikApiResponse;
    }

    public async Task<KodikApiResponse> GetMoreKodikDataAsync()
    {
        if (string.IsNullOrEmpty(_nextUrlRequest)) throw new Exception("_nextUrlRequest is empty");
        
        var client = new RestClient(_nextUrlRequest);
        var request = new RestRequest
        {
            Method = Method.Get,
        };
        
        request.AddHeader("Accept", "application/json");
        request.AddHeader("Content-Type", "application/json");

        var response = await client.ExecuteAsync(request);
        if (response.Content == null) throw new Exception("GetMoreKodikDataAsync content is null");
        
        var kodikApiResponse = JsonSerializer.Deserialize<KodikApiResponse>(response.Content);
        _nextUrlRequest = kodikApiResponse!.NextPage;
        return kodikApiResponse;
    }

    public async Task<KodikApiResponse> GetKodikDataSortedByRatingAsync()
    {
        var client = new RestClient(Urls.KodikList.GetStringValue());
        var request = new RestRequest
        {
            Method = Method.Get,
        };
        
        request.AddHeader("Accept", "application/json");
        request.AddHeader("Content-Type", "application/json");

        request.AddParameter(RequestParameterNames.Token.GetStringValue(), RequestParameterValues.Token.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.Type.GetStringValue(), RequestParameterValues.TypeAnimeSerial.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.WithMaterialData.GetStringValue(), RequestParameterValues.WithMaterialData.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.Sort.GetStringValue(), RequestParameterValues.Sort.GetStringValue(), ParameterType.QueryString);
        
        var response = await client.ExecuteAsync(request);
        if (response.Content == null) throw new Exception("GetKodikDataSortedByRatingAsync content is null");
        
        var kodikApiResponse = JsonSerializer.Deserialize<KodikApiResponse>(response.Content);
        _nextUrlRequestPopular = kodikApiResponse!.NextPage;
        return kodikApiResponse;
    }

    public async Task<KodikApiResponse> GetMoreKodikDataSortedByRatingAsync()
    {
        if (string.IsNullOrEmpty(_nextUrlRequestPopular)) throw new Exception("_nextUrlRequest is empty");
        
        var client = new RestClient(_nextUrlRequestPopular);
        var request = new RestRequest
        {
            Method = Method.Get,
        };
        
        request.AddHeader("Accept", "application/json");
        request.AddHeader("Content-Type", "application/json");

        var response = await client.ExecuteAsync(request);
        if (response.Content == null) throw new Exception("GetMoreKodikDataSortedByRatingAsync content is null");
        
        var kodikApiResponse = JsonSerializer.Deserialize<KodikApiResponse>(response.Content);
        _nextUrlRequestPopular = kodikApiResponse!.NextPage;
        return kodikApiResponse;
    }

    public async Task<KodikApiResponse> GetAnimeDataByIdAsync(string id)
    {
        var client = new RestClient(Urls.KodikSearch.GetStringValue());
        var request = new RestRequest
        {
            Method = Method.Post
        };
        
        request.AddHeader("Accept", "application/json");
        request.AddHeader("Content-Type", "application/json");
        
        request.AddParameter(RequestParameterNames.Token.GetStringValue(), RequestParameterValues.Token.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.Type.GetStringValue(), RequestParameterValues.TypeAnimeSerial.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.WithMaterialData.GetStringValue(), RequestParameterValues.WithMaterialData.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.Id.GetStringValue(), id, ParameterType.QueryString);
        
        var response = await client.ExecuteAsync(request);
        if (response.Content == null) throw new Exception("GetAnimeDataById content is null");
        
        return JsonSerializer.Deserialize<KodikApiResponse>(response.Content)!;
    }

    public async Task<KodikApiResponse> SearchAnimeByTitleAsync(string title)
    {
        var client = new RestClient(Urls.KodikSearch.GetStringValue());
        var request = new RestRequest
        {
            Method = Method.Post
        };
        
        request.AddHeader("Accept", "application/json");
        request.AddHeader("Content-Type", "application/json");
        
        request.AddParameter(RequestParameterNames.Token.GetStringValue(), RequestParameterValues.Token.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.Type.GetStringValue(), RequestParameterValues.TypeAnimeSerial.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.WithMaterialData.GetStringValue(), RequestParameterValues.WithMaterialData.GetStringValue(), ParameterType.QueryString);
        request.AddParameter(RequestParameterNames.Title.GetStringValue(), title, ParameterType.QueryString);
        
        var response = await client.ExecuteAsync(request);
        if (response.Content == null) throw new Exception("SearchAnimeByTitleAsync content is null");
        
        return JsonSerializer.Deserialize<KodikApiResponse>(response.Content)!;
    }

    public async Task<List<ShikimoriCalendarApiResponse>> GetCalendarDataAsync()
    {
        var client = new RestClient(Urls.Calendar.GetStringValue());
        var request = new RestRequest
        {
            Method = Method.Get
        };
        
        request.AddHeader("Accept", "application/json");
        request.AddHeader("Content-Type", "application/json");
        
        var response = await client.ExecuteAsync(request);
        if (response.Content == null) throw new Exception("GetCalendarDataAsync content is null");
        
        return JsonSerializer.Deserialize<List<ShikimoriCalendarApiResponse>>(response.Content)!;
    }
}