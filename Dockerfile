# Base runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Copy the solution file and all the project files
COPY TSWMS.GatewayService.sln . 
COPY TSWMS.GatewayService.Api/ TSWMS.GatewayService.Api/

# Restore dependencies
RUN dotnet restore "TSWMS.GatewayService.sln"

# Build the application
WORKDIR "/src/TSWMS.GatewayService.Api"
RUN dotnet build "TSWMS.GatewayService.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Publish the API project
FROM build AS publish
RUN dotnet publish "TSWMS.GatewayService.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

EXPOSE 8080
EXPOSE 8081

# Final stage - run the application
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TSWMS.GatewayService.Api.dll"]
