import 'package:flutter/material.dart';
import '../Componets/Text field design.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
          backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
        child: ListView(children: [
           SizedBox(height: 50.h),
           Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                  height: 80.h,
                  child: Image(
                      image: AssetImage('assets/images/Dayflow Sitting.png'))),
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Hello, Welcome ',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Happy to see you, to use app please register first.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ),
         SizedBox(
            height: 20.h,
          ),
          customTextfield(
            txt: 'Email Adress',
            onChanged: (data) {
              email = data;
            },
          ),
          customTextfield(
            txt: 'Password',
            onChanged: (data) {
              password = data;
            },
          ),
          
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      ShowSnackBar(context, 'Sign up successfully');
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ShowSnackBar(
                            context, 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        ShowSnackBar(context,
                            'The account already exists for that email.');
                      }
                    } catch (e) {
                      ShowSnackBar(context,
                          'The account already exists for that email.');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff771F98),
                  fixedSize:  Size(295.w, 46.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r)),
                ),
                child:  Text(
                  'Sign up',
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      //  color: Color(0xff771F98).withOpacity(0.8),
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    ' Sign in',
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
      ),
    );
  }

  void ShowSnackBar(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
