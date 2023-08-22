using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PreguntORT.Models;

namespace PreguntORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Privacy()
    {
        return View();
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        return View("ConfigurarJuego");
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
       Juego.CargarPartida(username,dificultad,categoria);
        List<Pregunta> Listado = null;
        Listado = BD.ObtenerPreguntas(dificultad, categoria);
        if(Listado!=null){
            return RedirectToAction("Jugar");
        }
        else{
            return RedirectToAction("ConfigurarJuego");
        }
    }
    public IActionResult Jugar()
    {
        ViewBag.pregunta_actual = Juego.ObtenerProximaPregunta();
        if(ViewBag.pregunta_actual != null)
        {
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.pregunta_actual);
            return RedirectToAction("Jugar");

        } else return RedirectToAction("Fin"); 
    }

    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.Respuesta.Correcta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View("Respuesta");
    }
}
