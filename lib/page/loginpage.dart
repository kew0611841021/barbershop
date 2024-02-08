import 'package:auth_buttons/auth_buttons.dart';
import 'package:barberapp/page/barberlist.dart';
import 'package:barberapp/service/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 320,
                      child: Column(
                        children: [
                          buildEmailInput(),
                          buildPasswordInput(),
                        ],
                      ),
                    ),
                    buildEmailSignin(),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailSignin() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EmailAuthButton(
        onPressed: () {
          AuthService()
              .signInWithEmail(_email.text, _password.text)
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BarberList(),
                ));
          });

          // AuthService()
          //     .signInWithEmail(_email.text, _password.text)
          //     .then((value) => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const HomePage(),
          //         )));
        },
      ),
    );
  }

  TextFormField buildEmailInput() {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(
        labelText: "E-mail",
      ),
    );
  }

  TextFormField buildPasswordInput() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
    );
  }
}
