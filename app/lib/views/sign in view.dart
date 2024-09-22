import 'package:app/Componets/Text%20field%20design.dart';
import 'package:app/constants.dart';
import 'package:app/views/sign%20up%20view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email;
  String? password;
  bool IsLoading = false ;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return ModalProgressHUD(
      inAsyncCall: IsLoading,
      child: Scaffold(
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
                    child: const Image(
                        image: AssetImage('assets/images/Dayflow Sitting.png'))),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Hello, Welcome Back',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Happy to see you again, to use your account please login first.',
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
              txt: 'Passwod',
              onChanged: (data) {
                password = data;
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: KColor.withOpacity(0.8),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 20.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      IsLoading = true; 
                      setState(() {
                        
                      });
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        ShowSnackBar(context, 'Sucsess Login');
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
                      IsLoading = false ; 
                      setState(() {
                        
                      });
                    }
                    else{
                      
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KColor,
                    fixedSize:  Size(295.w, 46.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r)),
                  ),
                  child:  Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
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
      ),
    );
  }

  void ShowSnackBar(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
