namespace PetTok.App.Models;

/// <summary>
/// Representa o usuário autenticado no aplicativo (modelo de domínio).
/// </summary>
public sealed class User
{
    public required string Id { get; init; }
    public required string Name { get; init; }
    public required string Email { get; init; }
    public string? AvatarUrl { get; init; }
    public string? Bio { get; init; }
    public int FollowersCount { get; init; }
    public int FollowingCount { get; init; }
    public int PetsCount { get; init; }
}