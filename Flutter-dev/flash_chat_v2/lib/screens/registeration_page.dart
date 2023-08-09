import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  var _username = "";
  File? _selectedImage;
  bool _isAuthenticating = false;

  final _form = GlobalKey<FormState>();

  void _registerUser() async {
    final isValid = _form.currentState!.validate();
    if (!isValid || _selectedImage == null) return;

    _form.currentState!.save();
    try {
      setState(() {
        _isAuthenticating = true;
      });
      final userCred = await fireBaseAuth.createUserWithEmailAndPassword(
          email: _userEmail, password: _userPassword);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("user_image")
          .child("${userCred.user!.uid}.jpg");
      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();

      FirebaseFirestore.instance
          .collection("user")
          .doc(userCred.user!.uid)
          .set({
        'username': _username,
        'email': _userEmail,
        'image_url': imageUrl,
      });

      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        // ....
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Authentication Failed')));
    }
    setState(() {
      _isAuthenticating = false;
    });
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
                              UserImagePicker(
                                onPickImage: (pickedImage) {
                                  _selectedImage = pickedImage;
                                },
                              ),
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
                                    labelText: "Username"),
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 4) {
                                    return "Username should be atleast 4 character!";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _username = newValue!;
                                },
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
                              if (_isAuthenticating)
                                CircularProgressIndicator(),
                              if (!_isAuthenticating)
                                ElevatedButton(
                                    onPressed: _registerUser,
                                    child: const Text("Create new account")),
                              if (!_isAuthenticating)
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage(),
                                          ));
                                    },
                                    child:
                                        const Text("Already have an account?"))
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
