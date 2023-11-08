import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/theme/contants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(gradient: gradient),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: CircleAvatar(
                      // Mude esta linha
                      backgroundColor: secondaryColor, // Mude esta linha
                      child: const Icon(
                        Icons.person,
                        size: 200,
                        color: linear3,
                      ),
                      radius: 112.5, // Mude esta linha
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      // Navegue para a tela de registro
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: linear2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Crie sua conta grátis',
                      style: TextStyle(
                        fontSize: 18,
                        color: tertiaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Navegue para a tela de login
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: linear2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Faça login',
                      style: TextStyle(
                        fontSize: 18,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  const Text(
                    'Crie sua conta grátis ou faça login',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class RegisterScreen extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController =
//       TextEditingController(); // Adicionado campo de e-mail
//   final TextEditingController passwordController = TextEditingController();

//   // Lista para armazenar informações de usuário (simulação)
//   final List<Map<String, String>> users = [];

//   RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cadastro'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Nome',
//               ),
//             ),
//             TextFormField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextFormField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Senha',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final name = nameController.text;
//                 final email = emailController.text;
//                 final password = passwordController.text;

//                 // Verifique se o nome, email e senha são válidos (simulação)
//                 if (name.isNotEmpty &&
//                     email.isNotEmpty &&
//                     password.isNotEmpty) {
//                   // Armazene as informações do usuário na lista (simulação)
//                   users.add(
//                       {'name': name, 'email': email, 'password': password});

//                   // Exiba uma mensagem de sucesso
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Cadastro Concluído'),
//                         content: const Text('Cadastro realizado com sucesso!'),
//                         actions: <Widget>[
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 } else {
//                   // Exiba a mensagem de erro se algum campo estiver vazio
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Erro de Cadastro'),
//                         content: const Text(
//                             'Preencha todos os campos obrigatórios.'),
//                         actions: <Widget>[
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               child: const Text('Me Cadastrar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
