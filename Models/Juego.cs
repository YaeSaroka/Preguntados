namespace PreguntORT.Models;
public static class Juego{
    private static string _username;
    private static int _puntajeActual;  
    private static int _cantidadPreguntasCorrectas;
    private static List<Pregunta> _preguntas;
    private static List<Respuesta> _respuestas;

    public static void InicializarJuego(){
        _username="";
        _puntajeActual=0;
        _cantidadPreguntasCorrectas=0;
        _preguntas=new List <Pregunta>();
        _respuestas=new List <Respuesta>();
    }
    public static List<Categoria> ObtenerCategoria(){
        List<Categoria> Listcategorias= BD.ObtenerCategorias();
        return Listcategorias;
    }
    public static string ObtenerUsername(){
        return _username;
    }
    public static int ObtenerPuntaje(){
        return _puntajeActual;
    }
    public static List<Dificultad> ObtenerDificultades(){
        List<Dificultad> Listdificultades= BD.ObtenerDificultad();
        return Listdificultades;
    }
    public static void CargarPartida(string username, int dificultad, int categoria){
        _preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        _respuestas = BD.ObtenerRespuestas(_preguntas);
        _username=username;
    }
    public static Pregunta ObtenerProximaPregunta(){
        Random r1 = new Random();
        int pos = r1.Next(_preguntas.Count);
        Pregunta Preguntita = _preguntas[pos];
        _preguntas.Remove(Preguntita);
        return Preguntita;
    }
    public static List<string> ObtenerProximasRespuestas(int id_Pregunta){
        _respuestas = BD.ObtenerRespuestas(_preguntas);
         List<string> ListOpciones= null;
        foreach(Respuesta resp in _respuestas){
            if(resp.idPregunta == id_Pregunta){
                ListOpciones.Add(resp.Contenido);
            }
        }
        return ListOpciones;
    }

    public static bool VerificarRespuesta(int idPregunta, int id_Respuesta){
        bool estado = false;
        foreach(Respuesta opcion in _respuestas){
            if(opcion.idRespuesta == id_Respuesta && opcion.Correcta == true){
                estado = true;
                _cantidadPreguntasCorrectas++;
                _puntajeActual += 10;
            }
        }
        return estado;
    }
} 