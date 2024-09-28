import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customTextfield extends StatelessWidget {
  const customTextfield({super.key , required this.txt, required this.onChanged});
  final String txt ;
  final Function(String)? onChanged ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Padding(
          padding: EdgeInsets.all(24.r),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 15,
              color: const Color(0xff771F98).withOpacity(0.8),
            ),
          ),
        ),
        //  SizedBox(height: 0.5,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: TextFormField(
            validator: (data) {
              if(data == ''){
                return 'This field is required';
              }
            },
            onChanged: onChanged,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                color: Color(0xff771F98),
              ) , borderRadius: BorderRadius.circular(24.r)),
              hintText: 'Enter $txt' ,
              hintStyle: TextStyle(
                fontSize: 15 , 
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
        ),
    ],
   );

  }
}