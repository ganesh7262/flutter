import 'package:flash_chat_v2/screens/login_screen.dart';
import 'package:flash_chat_v2/widget/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final fireBaseAuth = FirebaseAuth.instance;

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  var _userEmail = "";
  var _userPassword = "";
  final _form = GlobalKey<FormState>();

  void _registerUser() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;

    _form.currentState!.save();
    try {
      final userCred = await fireBaseAuth.createUserWithEmailAndPassword(
          email: _userEmail, password: _userPassword);
      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        // ....
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Authentication Failed')));
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
                              UserImagePicker(),
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
                                  onPressed: _registerUser,
                                  child: const Text("Create new account")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ));
                                  },
                                  child: const Text("Already have an account?"))
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
