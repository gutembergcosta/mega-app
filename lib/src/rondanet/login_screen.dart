import 'package:flutter/material.dart';
import 'package:mega_app/src/auth/blocos/custom_text_field.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mega_app/src/config/custom_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.0,
                    0.5,
                  ],
                  colors: [
                    Color.fromRGBO(184, 207, 245, 1),
                    Colors.white,
                  ],
                )
              ),
              child: Center(
                child: Image.asset(
                  'assets/img/logo.png', // Replace with your image path
                  width: 240, // Adjust as needed
                  height: 200, // Adjust as needed
                ),
              ),
            ),
          ),
          
          // formulario
          Container(
            padding: const EdgeInsets.only(
              left: 32,top: 30,right: 32,bottom: 24
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
          
                // Email field
                const CustomTextField(
                  icone: Icons.email,
                  label: 'Email',
                ),
          
                // Password field
                const CustomTextField(
                  icone: Icons.lock, label: 'Senha', isSecret: true
                ),
                
                // Botão entrar
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      ),
                      backgroundColor: CustomColors.azul,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('Entrar'),
                  ),
                ),
                
                // Esqueci minha senha
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        color: CustomColors.customContrastColor
                      )
                    ),
                  ),
                ),
          
                // Divisor
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Ou'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
          
                // Botão novo usuário
                SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom( 
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18 )
                      ) ,
                      side: BorderSide(
                        width: 2,
                        color: CustomColors.azul
                      ),
                      foregroundColor: CustomColors.azul,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
