import 'package:flutter/material.dart';
import 'package:mega_app/src/auth/blocos/custom_text_field.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mega_app/src/config/custom_colors.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nome da aplicação
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 40
                    ),
                    children: [
                      const TextSpan(
                        text: 'Qui',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      TextSpan(
                        text: 'Tanda',
                        style: TextStyle(
                          color: CustomColors.customContrastColor,
                        )
                      ),
                    ]
                  ),
                ), 
                SizedBox(
                  height: 25,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: Duration.zero,
                      animatedTexts: [
                        FadeAnimatedText('Frutas'),
                        FadeAnimatedText('Legumes'),
                        FadeAnimatedText('Vegetais'),
                      ], 
                    ),
                  ),
                ),
              ],
            ) 
          ),

          // formulario
          Container(
            padding: const EdgeInsets.only(
              left: 32,top: 30,right: 32,bottom: 24
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
                borderRadius:
                  BorderRadius.vertical(
                top: Radius.circular(45),
              ),
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
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      ),
                      backgroundColor: CustomColors.customSwatchColor,
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
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom( 
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18 )
                      ) ,
                      side: BorderSide(
                        width: 2,
                        color: CustomColors.customSwatchColor
                      ),
                      foregroundColor: CustomColors.customSwatchColor,
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
