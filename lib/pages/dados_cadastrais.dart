import 'package:contador_de_numeros/components/mytextlabel.dart';
import 'package:contador_de_numeros/repositories/linguagem_programacao.dart';
import 'package:contador_de_numeros/repositories/niveis.dart';
import 'package:flutter/material.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  // Nivel
  final nivelRepository = NiveisRpository();
  List<String> niveis = [];
  var nivelSelecionado = '';
  // Linguagem
  List<String> linguagens = [];
  final linguagemRepository = LinguagemProgramacao();
  var linguagemSelecionado = [];
  double salarioEscolhido = 0;
  int? tempoExperiencia;
  @override
  void initState() {
    linguagens = linguagemRepository.retornandoLinguagem();
    niveis = nivelRepository.retornaNiveis();
    super.initState();
  }

  List<DropdownMenuItem> returnItem(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (int i = 0; i >= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(child: Text(i.toString()), value: i));
    }
    return itens;
  }

  bool salvando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Dados Cadastrais', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: salvando
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Mytextlabel(label: 'Nome'),
                    const SizedBox(height: 8),
                    TextField(controller: nomeController),
                    const SizedBox(height: 8),
                    Mytextlabel(label: 'Data de Nascimento'),
                    TextField(
                      controller: dataNascimentoController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2006, 11, 11),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2100, 31, 12),
                        );
                        if (data != Null) {
                          dataNascimentoController.text = data.toString();
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    Mytextlabel(label: 'Nível'),
                    Column(
                      children: niveis
                          .map(
                            (String nivel) => RadioListTile(
                              dense: true,
                              title: Text(nivel.toString()),
                              value: nivel,
                              selected: nivelSelecionado == nivel,
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    Mytextlabel(label: 'Linguagem Preferida'),
                    Column(
                      children: linguagens
                          .map(
                            (e) => CheckboxListTile(
                              dense: true,
                              title: Text(e),
                              value: linguagemSelecionado.contains(e),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagemSelecionado.add(e);
                                  });
                                } else {
                                  setState(() {
                                    linguagemSelecionado.remove(e);
                                  });
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 8),
                    const Mytextlabel(label: 'Tempo de Experiencia'),
                    DropdownButton(
                      value: tempoExperiencia,
                      items: returnItem(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    Mytextlabel(
                      label:
                          'Pretenção Salarial. R\$ ${salarioEscolhido.round().toString()}',
                    ),
                    Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      },
                    ),
                    // Botão de salvar
                    TextButton(
                      onPressed: () {
                        if (nomeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Nome deve ser preenchido')),
                          );
                          return;
                        }
                        debugPrint('Esses são seus dados');
                        debugPrint(nomeController.text);
                        debugPrint(dataNascimentoController.text);
                        debugPrint(nivelSelecionado);
                        debugPrint(linguagemSelecionado.toString());

                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });

                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Dados Salvos')));
                      },
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
