namespace PetTok.App.Models;

/// <summary>
/// Sessão de autenticação atual, mantida em memória e persistida via SecureStorage.
/// </summary>
public sealed class AuthSession
{
    public required string AccessToken { get; init; }
    public required string RefreshToken { get; init; }
    public required DateTime ExpiresAtUtc { get; init; }
    public required User User { get; init; }

    public bool IsExpired => DateTime.UtcNow >= ExpiresAtUtc;
}