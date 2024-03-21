using AnimeWaveWebserver.Enums;
using AnimeWaveWebserver.Interfaces;
using AnimeWaveWebserver.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSingleton<IApiService, ApiService>();
builder.Services.AddSingleton<IApiParserService, ApiParserService>();

var app = builder.Build();

app.MapGet("previews/relevant", async (IApiParserService apiParserService) => await apiParserService.GetPreviewsAsync(SortBy.Relevant));
app.MapGet("previews/popular", async (IApiParserService apiParserService) => await apiParserService.GetPreviewsAsync(SortBy.Popular));

app.MapGet("morepreviews/relevant", async (IApiParserService apiParserService) => await apiParserService.GetMorePreviewsAsync(SortBy.Relevant));
app.MapGet("morepreviews/popular", async (IApiParserService apiParserService) => await apiParserService.GetMorePreviewsAsync(SortBy.Popular));

app.Run();