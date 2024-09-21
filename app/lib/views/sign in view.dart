import 'package:app/Componets/Text%20field%20design.dart';
import 'package:app/constants.dart';
import 'package:app/views/sign%20up%20view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
        child: ListView(children: [
          const SizedBox(height: 80),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  height: 80,
                  child: Image(
                      image: AssetImage('assets/images/Dayflow Sitting.png'))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Hello, Welcome Back',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Happy to see you again, to use your account please login first.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          customTextfield(
            txt: 'Email Adress',
            onChanged: (data) {
              email = data;
            },
          ),
          customTextfield(
            txt: 'Passwod',
            onChanged: (data) {
              password = data;
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Text(
                'Forget Password?',
                style: TextStyle(
                  color: KColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      Navigator.pushNamed(context, 'ch');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ShowSnackBar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        ShowSnackBar(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      ShowSnackBar(context, e.toString());
                    }
                  }
                  else{
                    
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColor,
                  fixedSize: const Size(295, 46),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      //  color: Color(0xff771F98).withOpacity(0.8),
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'signUp');
                  },
                  child: const Text(
                    ' Sign up',
                    style: TextStyle(color: KColor),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 50,),
        ]),
      ),
    );
  }

  void ShowSnackBar(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
