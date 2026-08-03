using System;
using System.Text.RegularExpressions;

namespace PetTok.Views;

public partial class LoginPage : ContentPage
{
    public LoginPage()
    {
        InitializeComponent();
    }

    private void MostrarSenha(object sender, EventArgs e)
    {
        SenhaEntry.IsPassword = !SenhaEntry.IsPassword;
    }

    private async void Login_Clicked(object sender, EventArgs e)
    {
        string email = EmailEntry.Text ?? "";
        string senha = SenhaEntry.Text ?? "";

        if (string.IsNullOrWhiteSpace(email))
        {
            await DisplayAlert("Erro", "Informe o e-mail.", "OK");
            return;
        }

        if (!Regex.IsMatch(email,
            @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        {
            await DisplayAlert("Erro", "Digite um e-mail válido.", "OK");
            return;
        }

        if (string.IsNullOrWhiteSpace(senha))
        {
            await DisplayAlert("Erro", "Informe a senha.", "OK");
            return;
        }

        if (senha.Length < 4)
        {
            await DisplayAlert("Erro", "Senha muito curta.", "OK");
            return;
        }

        await DisplayAlert("Sucesso", "Login realizado!", "OK");

        // Exemplo:
        // await Navigation.PushAsync(new HomePage());
    }
}
