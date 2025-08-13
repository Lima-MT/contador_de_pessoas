import 'package:contador_de_numeros/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool isObscureText = true;

  @override
  void dispose() {
    emailControler.dispose();
    passwordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 32, 56),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person, size: 150, color: Colors.white),
              Text(
                'Você tem cadastro?',
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Faça seu login e mude de vida',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // E-mail Textfield
              TextField(
                style: TextStyle(color: Colors.white),
                controller: emailControler,
                decoration: InputDecoration(
                  label: Text('E-mail', style: TextStyle(color: Colors.white)),
                  prefixIcon: Icon(Icons.email, color: Colors.purple),
                ),
              ),
              const SizedBox(height: 12),
              // Senha TextField
              TextField(
                style: TextStyle(color: Colors.white),
                obscureText: isObscureText,
                controller: passwordControler,
                decoration: InputDecoration(
                  label: Text('Senha', style: TextStyle(color: Colors.white)),
                  prefixIcon: Icon(
                    Icons.password_rounded,
                    color: Colors.purple,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (emailControler.text.trim() == "" &&
                      passwordControler.text.trim() == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro ao efetuar login')),
                    );
                    debugPrint('Login não efetuado');
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login efetuado com sucesso')),
                    );
                    debugPrint('Login feito');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text('Entrar', style: TextStyle(color: Colors.white)),
              ),
              // Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ),
                ],
              ),

              // Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
