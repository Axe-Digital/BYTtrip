import 'package:flutter/material.dart';
import 'package:chat/screens/main_screen.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF016684),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            Flexible(
              fit: FlexFit.loose,
              child: _buildForm(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: const Text(
        "Sign In",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 3 / 4,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTextField("Username", Icons.person),
          const SizedBox(height: 20),
          _buildTextField("Email", Icons.email),
          const SizedBox(height: 20),
          _buildTextField("Phone Number", Icons.phone),
          const SizedBox(height: 20),
          _buildTextField("Password", Icons.lock, obscureText: true),
          const SizedBox(height: 20),
          _buildTextField("Confirm Password", Icons.lock),
          const Spacer(),
          _buildSignInButton(context),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, IconData suffixIcon,
      {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      },
      child: const Text('Sign In'),
    );
  }
}
