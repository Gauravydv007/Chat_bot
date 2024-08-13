// import 'dart:async';
// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:chat_bot/models/chat_message.dart';
// import 'package:chat_bot/repos/chat.dart';
// import 'package:meta/meta.dart';

// part 'chat_bloc_event.dart';
// part 'chat_bloc_state.dart';

// class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
//   ChatBlocBloc() : super(ChatSuccessState(messages: [])) {
//     on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
//   }
//   List<ChatMessageModel> messages = [];
//   bool generating = false;

//   FutureOr<void> chatGenerateNewTextMessageEvent(
//       ChatGenerateNewTextMessageEvent event,
//       Emitter<ChatBlocState> emit) async {
//     messages.add(ChatMessageModel(
//         role: "user", parts: [ChatPartModel(text: event.inputMessage, image: event.imageFile)]));
//     emit(ChatSuccessState(messages: messages));
//     generating = true;

//     String generatedText = await ChatRepo.chatTextGenerationRepo(messages);
//       // String generatedText = await ChatRepo.chatTextGenerationRepo(messages, event.imageFile);
//       // String generatedText = await ChatRepo.chatTextGenerationRepo(messages, event.base64Image);

    

//     if (generatedText.length > 0) {
//       messages.add(ChatMessageModel(
//           role: 'model', 
//           parts: [ChatPartModel(text: generatedText, image: event.imageFile)]));
//       emit(ChatSuccessState(messages: messages));
//     }
//     generating = false;
//   }
// }






import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_bot/models/chat_message.dart';
import 'package:chat_bot/repos/chat.dart';
import 'package:meta/meta.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  ChatBlocBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  List<ChatMessageModel> messages = [];
  bool generating = false;

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event,
      Emitter<ChatBlocState> emit) async {
    messages.add(ChatMessageModel(
        role: "user", parts: [ChatPartModel(text: event.inputMessage, image: event.imageFile)]));
    emit(ChatSuccessState(messages: messages));
    generating = true;

    String generatedText = await ChatRepo.chatTextGenerationRepo(event.inputMessage, messages);

    if (generatedText.length > 0) {
      messages.add(ChatMessageModel(
          role: 'model', 
          parts: [ChatPartModel(text: generatedText, image: event.imageFile)]));
      emit(ChatSuccessState(messages: messages));
    }
    generating = false;
  }
}
