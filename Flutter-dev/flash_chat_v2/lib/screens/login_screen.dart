import 'package:flash_chat_v2/screens/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _userEmail = "";
  var _userPassword = "";
  final _form = GlobalKey<FormState>();

  void _loginUser() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;

    _form.currentState!.save();
    try {
      final userCred = await fireBaseAuth.signInWithEmailAndPassword(
          email: _userEmail, password: _userPassword);
      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        // ....
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message ?? 'Authentication Failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/registeration_bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Hero(
                tag: 1,
                child: SizedBox(
                  height: 250,
                  child: Image.asset("images/logo.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                          key: _form,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "Email Address"),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains("@")) {
                                    return "Please enter a valid email address";
                                  }

                                  return null;
                                },
                                onSaved: (newValue) => _userEmail = newValue!,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "Password"),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 6) {
                                    return "Password should be atleast 6 character long";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _userPassword = newValue!,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: _loginUser,
                                  child: const Text("Login")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterationPage(),
                                        ));
                                  },
                                  child: const Text("Don't have an account?"))
                            ],
                          )),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
