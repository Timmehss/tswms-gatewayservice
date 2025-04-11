using Microsoft.AspNetCore.Mvc;

namespace TSWMS.GatewayService.Api.Controllers
{
    public class OrderController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
