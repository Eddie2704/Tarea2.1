import 'package:flutter/material.dart';
import 'package:tarea_2_1/src/views/loginpage.dart';
import 'package:tarea_2_1/src/widgets/textfields.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool showPassword = false;
  

// Funcion para validar los datos
  void validar() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final pass = passwordController.text;
    final confirm = confirmController.text;

    String? error;

    if ([name, email, phone, pass, confirm].any((v) => v.isEmpty)) {
      error = "Todos los campos son obligatorios.";
    } else if (!email.endsWith('@unah.hn')) {
      error = "Use un correo institucional que termine en @unah.hn";
    } else if (pass.length < 6 || !RegExp(r'[!@#\$%^&*(),.?":{}|<>_]').hasMatch(pass)) {
      error = "La contraseña debe tener al menos 6 caracteres y un carácter especial.";
    } else if (pass != confirm) {
      error = "Las contraseñas no coinciden.";
    } 

    if (error != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text('$error'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
          ],
        ),
      );
    } else {
      Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => LoginPage(
      correoInicial: email,
      contrasenaInicial: pass,
    ),
  ),
);
 }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Crea Una cuenta", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("Por favor llena todos los espacios para continuar.", style: TextStyle(fontSize: 16, color: Colors.black54)),
              SizedBox(height: 24),

              CustomTextField(label: "Nombre Completo", 
              controller: nameController,
              prefixIcon: Icon(Icons.person_2),),

              SizedBox(height: 16),
              CustomTextField(label: "Correo Institucional", 
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey.shade700)),

              SizedBox(height: 16),
              CustomTextField(label: "Telefono", 
              controller: phoneController,
              prefixIcon: Icon(Icons.phone, color: Colors.grey.shade700), 
              keyboardType: TextInputType.phone),
          
              SizedBox(height: 16),

              CustomTextField(
                label: "Contraseña",
                controller: passwordController,
                obscureText: !showPassword,
                prefixIcon: Icon(Icons.lock_outline_sharp, color: Colors.grey.shade700),
                suffixIcon: IconButton(
                  icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => showPassword = !showPassword),
                ),
              ),

              SizedBox(height: 16),
              CustomTextField(label: "Confirmar contraseña ", 
              controller: confirmController,
              prefixIcon: Icon(Icons.check_circle, color: Colors.grey.shade700), 
              obscureText: !showPassword),

              SizedBox(height: 16),
              
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: validar,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.yellow.shade800,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Crear Cuenta", style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),

              SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ya tienes una cuenta? '),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
              },
                  child: Text("Inicia sesion",style: TextStyle(color: Colors.yellow.shade800)),
                )
                
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
