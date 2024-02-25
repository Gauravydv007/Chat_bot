// import 'package:chat_bot/bloc/chat_bloc_bloc.dart';
// import 'package:chat_bot/models/chat_message.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ChatBlocBloc chatBlocBloc = ChatBlocBloc();
//   TextEditingController textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<ChatBlocBloc, ChatBlocState>(
//         bloc: chatBlocBloc,
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           switch(state.runtimeType) {
//             case ChatSuccessState:
//             List<ChatMessageModel> messages = (state as ChatSuccessState).messages;
//              return Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   opacity: 0.8,
//                     image: AssetImage("assets/6534541.jpg"),
//                     fit: BoxFit.cover)),
//             child: Column(
//               children: [
//                 Container(
//                   height: 100,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Chat Pod"),
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.image_search,
//                                 color: Colors.white,
//                               )),
//                         ]),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: messages.length,
//                     itemBuilder: (context, index){
                      
//                   return Container(
                    
//                     margin: EdgeInsets.only(top: 10),
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Color.fromARGB(255, 77, 248, 213).withOpacity(0.5),
//                     ),
//                     child:
//                      Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [
//                         Text(messages[index].role == "user" ? "User" : "Space Pod",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: messages[index].role == "user" ? Colors.amber : Colors.deepPurple,
//                         ),),

//                         const SizedBox(height: 10,),
//                          Text(messages[index].parts.first.text, style: TextStyle(height: 1.2, fontSize: 18, color: Colors.black),),
//                        ],
//                      ));
//                 })),
//                 if(chatBlocBloc.generating)
//                 Lottie.asset('assets/Loader.json'),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: TextField(
//                             controller: textEditingController,
//                         style: TextStyle(color: Colors.black),
//                         cursorColor: Colors.deepOrange,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(color: Colors.black12),
//                           ),
//                           fillColor: Colors.white,
//                           hintText: "Ask Something from AI",
//                                 hintStyle:
//                                     TextStyle(color: Colors.grey.shade400),
//                           filled: true,
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(
//                                 color: Theme.of(context).primaryColor),
//                           ),
//                         ),
//                       )),
//                       SizedBox(
//                         width: 10,
//                       ),
//                        InkWell(
//                         onTap: () {
//                           if(textEditingController.text.isNotEmpty){
//                             String text = textEditingController.text;
//                             textEditingController.clear();
//                             chatBlocBloc.add(ChatGenerateNewTextMessageEvent(
//                               inputMessage: text
//                               ));
//                           }
//                         },
//                          child: CircleAvatar(
//                           radius: 33,
//                           backgroundColor: Colors.white,
//                           child: CircleAvatar(
//                             radius: 30,
//                             backgroundColor: Colors.black,
//                             child: Icon(
//                               Icons.send,
//                               color: Colors.white,
//                             ),
//                           ),
//                                                ),
//                        )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );



            
//             default: 
//             return CircularProgressIndicator();
//           }
         


//         },
//       ),
//     );
//   }
// }





import 'package:chat_bot/bloc/chat_bloc_bloc.dart';
import 'package:chat_bot/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBlocBloc chatBlocBloc = ChatBlocBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBlocBloc, ChatBlocState>(
        bloc: chatBlocBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.8,
                        image: AssetImage("assets/6534541.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Chat Pod"),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.image_search,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      
                      child: ListView.builder(

                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Align(

                              alignment: messages[index].role == "user"
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromARGB(255, 77, 248, 213)
                                        .withOpacity(0.5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        messages[index].role == "user"
                                            ? "User"
                                            : "Space Pod",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: messages[index].role == "user"
                                              ? Colors.amber
                                              : Colors.deepPurple,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        messages[index].parts.first.text,
                                        style: TextStyle(
                                            height: 1.2,
                                            fontSize: 18,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    if (chatBlocBloc.generating) Lottie.asset('assets/Loader.json'),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12,),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.deepOrange,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.black12),
                                ),
                                fillColor: Colors.white,
                                hintText: "Ask Something from AI",
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatBlocBloc.add(
                                    ChatGenerateNewTextMessageEvent(
                                        inputMessage: text));
                              }
                            },
                            child: CircleAvatar(
                              radius: 33,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );

            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
