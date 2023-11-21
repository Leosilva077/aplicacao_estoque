// import 'package:flutter/material.dart';

// class BottonBarNavigator extends StatefulWidget {
//   const BottonBarNavigator({super.key});

//   @override
//   State<BottonBarNavigator> createState() => _BottonBarNavigatorState();
// }

// class _BottonBarNavigatorState extends State<BottonBarNavigator> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgets = <Widget>[
//     Text(
//       'Home',
//       style: TextStyle(
//           color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
//     ),
//     Text(
//       'Search',
//       style: TextStyle(
//           color: Colors.blueGrey, fontSize: 30, fontWeight: FontWeight.bold),
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgets.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: _getBottonNavigationBar(),
//     );
//   }

//   BottomNavigationBar _getBottonNavigationBar() {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home_rounded,
//               color: Colors.blue,
//             ),
//             label: 'Home'),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search_rounded,
//               color: Colors.blue,
//             ),
//             label: 'Search'),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.category_outlined,
//               color: Colors.blue,
//             ),
//             label: 'Categoria'),
//       ],
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//     );
//   }
// }






// /*
// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   // Lista para armazenar informações de usuário (simulação)
//   final List<Map<String, String>> users = [];

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Faça Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
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
//                 final email = emailController.text;
//                 final password = passwordController.text;

//                 // Verifique se o email e a senha correspondem a um usuário na lista (simulação)
//                 bool userFound = false;
//                 for (final user in users) {
//                   if (user['email'] == email && user['password'] == password) {
//                     userFound = true;
//                     break;
//                   }
//                 }

//                 if (userFound) {
//                   // Navegue para a próxima tela (a ser implementada)
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => const NextScreen(),
//                     ),
//                   );
//                 } else {
//                   // Exiba a mensagem de erro se não encontrar correspondência
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Erro de Login'),
//                         content: const Text('Email ou Senha Incorretos'),
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
//               child: const Text('Entrar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// } */

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
