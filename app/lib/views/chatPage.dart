import 'package:app/models/message.dart';
import 'package:app/widgets/chatBubble.dart';
import 'package:app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
   static String id = 'ChatPage';
   //FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference Messages = FirebaseFirestore.instance.collection('Messages');
  TextEditingController controller = TextEditingController();
  ScrollController _controller = ScrollController() ;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Messages.orderBy('createdAt' , descending: true).snapshots(),
      builder: (context, snapshot) {
       if(snapshot.hasData){
            List<Message> ListOfMessages = [] ;
            for(int i = 0 ; i < snapshot.data!.docs.length ; i++)
            {
              ListOfMessages.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: KColor,
            leading: const Icon(
             Icons.arrow_back,
             color: Colors.white,
            ),
            title: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80.w),
              child: SizedBox(
                height: 60.h,
                child: const Row(
                  children: [
                      Image(image: AssetImage('assets/images/Stuck at Home - Mailing List.png')),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: ListOfMessages.length,
                  itemBuilder: (context , index) { 
                  return chatBubble(txt: ListOfMessages[index].msg,);
                }),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                  controller: controller,
                  onSubmitted: (data){
                   Messages.add({
                      'msg':data,
                      'createdAt' : Timestamp.now(),
                   });
                   controller.clear();
                   _controller.animateTo(
                     0,
                     duration: const Duration(milliseconds: 500) , 
                     curve: Curves.fastOutSlowIn,
                   );                   

                
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: KColor,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                    ),
                    suffixIcon: IconButton(onPressed: (){}, icon:  const Icon(Icons.send),
                      color: KColor,)
                  ),
               ),
               ),
            ],
          )
        );
          }
          else{
            return Text('Loading...');
          }
      }
    );
  }
}

