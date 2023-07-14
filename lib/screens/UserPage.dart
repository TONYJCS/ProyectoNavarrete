import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navarrete/screens/HomePage.dart';

class UserPage extends StatefulWidget {
  @override
  State createState() {
    return _UserPageState();
  }
}
class _UserPageState extends State<UserPage>{
  
  late String email,password;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String error='';

  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrate'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey],
            stops: [0.5, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
  radius: 50, // Tamaño del círculo
  backgroundImage: NetworkImage(
    'https://www.dgsac.com.pe/wp-content/uploads/2021/02/DISTRIBUIDORA-NAVARRETE.png', // URL de la imagen de perfil
  ),
),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Crear Usuario",
                  style: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
                ),
              ),
              Offstage(
                offstage: error == '',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: formulario(),
              ),
              buttonCrearUsuario(),
            ],
          ),
        ),
      ),
    );
  }

  Widget formulario(){
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmail(),
        const Padding(padding: EdgeInsets.only(top: 12)),
        buildPassword(),

    ],));
  }

  Widget buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Correo",
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(8),
          borderSide: new BorderSide(color: Colors.black)
        )
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String? value){
        email = value!;
      },
      validator: (value){
        if(value!.isEmpty){
          return "Campo Obligatorio";
        }
        return null;
      },
    );

  }
  Widget buildPassword() {
  return Stack(
    alignment: Alignment.centerRight, // Alinea los elementos en el centro-derecha del Stack
    children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: "Contraseña", // Etiqueta del campo de entrada de contraseña
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Borde redondeado
            borderSide: BorderSide(color: Colors.black), // Color del borde
          ),
          filled: true,
          fillColor: Colors.white70, // Color de fondo del campo de entrada de contraseña (fondo semitransparente)
        ),
        obscureText: _obscureText, // Controla la visibilidad de la contraseña
        style: TextStyle(color: Colors.black87), // Color del texto dentro del campo
        cursorColor: Colors.black, // Color del cursor
        validator: (value) {
          if (value!.isEmpty) {
            return "Campo Obligatorio"; // Valida que el campo no esté vacío
          }
          return null;
        },
        onSaved: (String? value) {
          password = value!; // Guarda el valor del campo de contraseña en la variable password
        },
      ),
      IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off, // Muestra el ícono de "visibility" si _obscureText es true, o el ícono de "visibility_off" si es false
          color: Colors.black, // Color del ícono
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText; // Cambia el estado de _obscureText para mostrar u ocultar la contraseña
          });
        },
      ),
    ],
  );
}

 Widget buttonCrearUsuario() {
  return FractionallySizedBox(
    widthFactor: 0.6,
    child: ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          UserCredential? credenciales = await crear(email, password);
          if (credenciales != null) {
            if (credenciales.user != null) {
              await credenciales.user!.sendEmailVerification();
              Navigator.of(context).pop();
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[500], // Cambia el color del botón aquí
      ),
      child: Text("Registrarse"),
    ),
  );
}

   Future<UserCredential?>crear(String email,String password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      if (e.code == 'email-already-in-use'){
          //Correo en uso
          setState(() {
            error = 'Usuario no encontrado';
          });
      }
      if (e.code == 'weak-password'){
         //Contraseña muy debil
         setState(() {
            error = 'Contraseña debil';
          });
      }
       
    }

   }
}
