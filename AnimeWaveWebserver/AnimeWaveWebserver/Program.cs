using AnimeWaveWebserver.Interfaces;
using AnimeWaveWebserver.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddScoped<IApiService, ApiService>();

var app = builder.Build();

app.Run();