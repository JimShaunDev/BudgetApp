FROM  mcr.microsoft.com/dotnet/sdk:7.0
WORKDIR /BudgetApp2023
COPY ["API/API.csproj", "API/"]
RUN dotnet restore "API/API.csproj"

COPY . .
WORKDIR "/BudgetApp2023/API"
RUN dotnet build "API.csproj" -c Release -o /app

RUN dotnet publish "API.csproj" -c Release -o /app

ENV ASPNETCORE_URLS=http://+:5000;https://+:5001
EXPOSE 80
EXPOSE 443
WORKDIR /app
ENTRYPOINT ["dotnet", "API.dll"]


