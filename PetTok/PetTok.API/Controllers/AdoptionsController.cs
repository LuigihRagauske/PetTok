using Microsoft.AspNetCore.Mvc;

namespace PetTok.API.Controllers
{
    public class AdoptionsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
