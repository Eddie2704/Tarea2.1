import 'package:flutter/material.dart';
import 'package:tarea_2_1/src/widgets/textfields.dart';

class LoginPage extends StatefulWidget {
  final String correoInicial;
  final String contrasenaInicial;

  const LoginPage({
    this.contrasenaInicial="",
    this.correoInicial="",
    super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  @override
void initState() {
  super.initState();
  emailController.text = widget.correoInicial;
  passwordController.text = widget.contrasenaInicial;
  
}

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  // Funcion para comprobar el login
  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    if(emailController.text.isEmpty || passwordController.text.isEmpty){
      showDialog(context: context, builder:(context){
        return AlertDialog(
          title: Text("Credenciales incorrectas",style: TextStyle(color: Colors.blue),),
          content: Text("El correo y contraseña no deben quedar vacios"),
          actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();},
                      child: Text('Entiendo'),
                      ), 
                    ],
                  );
                });
        }
    else {
    if (email.endsWith('@unah.hn')) {
      if(password.length>=6 ) {
        if(RegExp(r'[!@#\$%^&*(),.?":{}|<>_]').hasMatch(password)){
        Navigator.pushReplacementNamed(context, '/home');
        }
        else{ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("su contraseña debe tener al menos un caracter especial (- , . _)")),
      );}
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("su contraseña debe ser de almenos 6 caracteres")),
      );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Su correo debe ser  y terminar en @unah.hn")),
      );
    }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32,vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.storm_outlined, size: 64, color: Colors.blueAccent),
              SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "Bienvenido de nuevo",
                    style: TextStyle(fontSize: 30, color: Colors.yellow.shade800),
                  ),SizedBox(width: 30,),
                  Icon(Icons.add_home_work_outlined,color:  Colors.yellow.shade800,size: 30,)
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Estamos felices de tenerte por aqui, utiliza",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ), Row(
                children: [
                  Text(
                    "tu cuenta para iniciar sesión.",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
              SizedBox(height: 30,),
          
              CustomTextField(
                label: "Correo Institucional",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined,color: Colors.grey.shade700,),
              ),
          
              SizedBox(height: 30),
              CustomTextField(
                label: "Contraseña",
                controller: passwordController,
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility: Icons.visibility_off ,
                  ),
                  onPressed: () => setState(() => showPassword = !showPassword),
                ),
                keyboardType: TextInputType.name,
                prefixIcon:Icon(Icons.lock,color: Colors.grey.shade700,),
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: () {
                  },
                    child: Text("Olvidaste tu constraseña?",style: TextStyle(color: Colors.grey),))
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.yellow.shade700,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text("Iniciar sesión", style: TextStyle(fontSize: 16,color: Colors.black)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: Colors.blueGrey)),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Inicia sesion con Google o Facebook',style: TextStyle(color: Colors.grey.shade700),),
                  ),
                  Expanded(child: Divider(color: Colors.blueGrey)),
                ],
              ),
                SizedBox(height: 20), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){},
                    child: SizedBox(
                      child: Row(children: [
                        Icon(Icons.facebook,size: 40,color: Colors.blue,),
                        Text("Facebook",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),)
                      ],),
                    ),
                  ),
                  
                  InkWell(
                    onTap: (){},
                    child: SizedBox(
                      child: Row(children: [
                        Icon(Icons.g_mobiledata_rounded,size: 50,color: Colors.blueAccent,),
                        Text("Google      ",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),)
                      ],),
                    ),
                  ),
                  
                ],
              ),
              SizedBox(height: 20), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No tienes una cuenta?"),
                  InkWell(onTap: () {
                    Navigator.pushReplacementNamed(context, '/record');
                  },child: 
                  Text("  Registrate ahora",style: TextStyle(color: Colors.yellow.shade700),),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
