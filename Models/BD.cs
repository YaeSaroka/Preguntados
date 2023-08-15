using System.Data.SqlClient;
using Dapper;
namespace PreguntORT.Models;
public static class BD
{
    private static string ConnectionString { get; set; } = @"Server=localhost;DataBase=PreguntORT;Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias(){
         List<Categoria> ListadoCategoria;
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Categorias";
            ListadoCategoria=db.Query<Categoria>(sql).ToList();
        }
        return ListadoCategoria;
    }
    public static List<Dificultad> ObtenerDificultad(){
         List<Dificultad> ListadoDificultad;
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            ListadoDificultad=db.Query<Dificultad>(sql).ToList();
        }
        return ListadoDificultad;
    }
    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria){
         List<Pregunta> ListadoPregunta = null;
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            if(dificultad==-1 && categoria!=-1 || dificultad==-1 && categoria==-1){
                string sql = "SELECT * FROM Preguntas";
                ListadoPregunta=db.Query<Pregunta>(sql).ToList();
            }
            else if(dificultad!=-1 && categoria==-1){
                string sql = "SELECT * FROM Preguntas WHERE idDificultad = dificultad";
                ListadoPregunta=db.Query<Pregunta>(sql).ToList();
            }
            else{
                string sql = "SELECT * FROM Preguntas WHERE idDificultad = dificultad AND idCategoria = categoria";
                ListadoPregunta=db.Query<Pregunta>(sql).ToList();
            }
            return ListadoPregunta; 
        }
    }
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> ListadoPregunta)
    {
        List<Respuesta> ListadoRespuesta = null;
        using (SqlConnection db = new SqlConnection(ConnectionString))
        foreach (Pregunta item in ListadoPregunta)
        {
            string sql = "SELECT * FROM Respuestas WHERE idPregunta = " + item.idPregunta;
            ListadoRespuesta=db.Query<Respuesta>(sql).ToList();
        }
        return ListadoRespuesta;
    }
}