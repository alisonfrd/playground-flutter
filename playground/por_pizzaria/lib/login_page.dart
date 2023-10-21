import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:por_pizzaria/splahs_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool isVisibleIcon = true;
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff262626),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Bem-vindo de volta!',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17),
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      'assets/png/pizza.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 36),
                    MyTextFormField(
                      hintText: 'Digite seu e-mail',
                      controller: emailController,
                      icon: const Icon(
                        Icons.email,
                        color: Color(0xff83A603),
                      ),
                    ),
                    const SizedBox(height: 16),
                    MyTextFormField(
                      hintText: 'Digite sua senha',
                      controller: senhaController,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibleIcon = !isVisibleIcon;
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          isVisibleIcon
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xff83A603),
                        ),
                      ),
                      obscureText: obscureText,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () {},
                        child: Text(
                          'Não possue conta? Cadastrar-se',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 9),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff83A603))),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Entrar',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 15),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
