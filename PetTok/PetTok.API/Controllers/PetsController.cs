using Microsoft.AspNetCore.Mvc;

namespace PetTok.API.Controllers
{
    public class PetsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
