import 'package:contador_de_numeros/pages/dados_cadastrais.dart';
import 'package:contador_de_numeros/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext ctx) => Wrap(
                    children: [
                      ListTile(
                        title: Text('camera'),
                        leading: Icon(Icons.camera),
                      ),
                      ListTile(
                        title: Text('galeria'),
                        leading: Icon(Icons.gamepad_outlined),
                      ),
                    ],
                  ),
                );
              },
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network('https://imgur.com/a/65jjXH2'),
                ),
                accountName: Text('Matheus Lima'),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                accountEmail: Text('email@gmail.com.br'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DadosCadastrais()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 4),
                    const Text('Dados Cadastrais'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(),
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                child: Text('Configuração'),
              ),
            ),
            const SizedBox(height: 10),
            Divider(),
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                child: Text('Termos de Privacidade'),
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) => AlertDialog(
                    title: Text('Meu App'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text('Sim'),
                      ),
                    ],
                    content: Wrap(
                      children: [
                        Text('Você sairá do app'),
                        Text('Quer sair mesmo?'),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    const SizedBox(width: 8),
                    Text('Sair'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
