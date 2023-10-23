/*
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Lista para armazenar informações de usuário (simulação)
  final List<Map<String, String>> users = [];

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faça Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;

                // Verifique se o email e a senha correspondem a um usuário na lista (simulação)
                bool userFound = false;
                for (final user in users) {
                  if (user['email'] == email && user['password'] == password) {
                    userFound = true;
                    break;
                  }
                }

                if (userFound) {
                  // Navegue para a próxima tela (a ser implementada)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NextScreen(),
                    ),
                  );
                } else {
                  // Exiba a mensagem de erro se não encontrar correspondência
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Erro de Login'),
                        content: const Text('Email ou Senha Incorretos'),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
} */