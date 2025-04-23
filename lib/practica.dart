/* En esta práctica construirás un formulario en Flutter para registrar libros. 
El formulario debe incluir campos como título, autor, editorial, año y género. 
Al completar y enviar el formulario, los datos deben enviarse a una base de datos en Firebase Realtime Database.
Asegúrate de usar tu propia URL de Firebase en la petición POST.
Sigue las instrucciones por fases que encontrarás comentadas a lo largo del archivo para estructurar tu código.*/

// importaciones necesarias
// - Material de Flutter
// - http para hacer peticiones
// - convert para convertir datos a JSON

// Crear un StatefulWidget llamado LibrosForm

// Crear el estado (_LibrosFormState) del widget LibrosForm

// Declarar una clave global para el formulario (GlobalKey<FormState>)

// Crear controladores de texto para:
// - título
// - autor
// - editorial
// - año

// Declarar una variable para el género seleccionado (String?)

// Crear una lista de géneros (Ficción, No ficción, Fantasía, Ciencia, Historia)

// Crear una función asíncrona para enviar el formulario:
// - Validar el formulario
// - Construir un mapa con los datos ingresados (título, autor, editorial, año, género, timestamp)
// - Realizar una petición POST a Firebase
//   - IMPORTANTE: Reemplazar la URL con el path de Firebase personal de cada estudiante
//     Ejemplo: 'https://<tu-proyecto>.firebaseio.com/libros.json'
// - Mostrar un mensaje en pantalla dependiendo si fue exitoso o no

// En el método build:
// - Devolver un Scaffold con AppBar que diga "Formulario Libros"
// - Dentro del body, usar Padding y Form con la clave del formulario

// Agregar los siguientes campos con validaciones:
// - TextFormField para el título
// - TextFormField para el autor
// - TextFormField para la editorial
// - TextFormField para el año
// - DropdownButtonFormField para el género (usar la lista declarada antes)

// Agregar un botón ElevatedButton que al presionar ejecute la función para enviar el formulario
