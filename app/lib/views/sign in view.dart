import 'package:app/Componets/Text%20field%20design.dart';
import 'package:app/views/sign%20up%20view.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(children: [
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
        const customTextfield(txt: 'Email Adress'),
        const customTextfield(txt: 'Passwod'),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(
              'Forget Password?',
              style: TextStyle(
                color: const Color(0xff771F98).withOpacity(0.8),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff771F98),
                fixedSize: const Size(295, 46),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 15,
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
                  }
                 ,
                child: const Text(
                  ' Sign up',
                  style: TextStyle(
                    color: Color(0xff771F98),
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 50,),
      ]),
    );
  }
}
