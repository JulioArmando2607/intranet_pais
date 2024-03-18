import 'package:flutter/material.dart';
import 'package:intranet_pais/view/Home/home.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 2, // adjust the ratio based on your design requirement
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _buildSignInForm(context),
            ),
          ),
          Expanded(
            flex: 3, // adjust the ratio based on your design requirement
            child: _buildIllustration(),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/logo_pais.jpg'),
        const Text('INGRESE A SU CUENTA',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl),
        const SizedBox(height: 8),
        TextFormField(decoration: const InputDecoration(labelText: 'Usuario')),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Contraseña'),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 15, 172, 235)),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
// Handle the sign-in action
          },
          child: Text(
            'Iniciar Sesion',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/march.jpg'),
          fit: BoxFit.cover, // This will fill the whole container space
        ),
      ),
    );
  }
}
