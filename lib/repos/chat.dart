// import 'dart:math';

// import 'package:chat_bot/models/chat_message.dart';
// import 'package:chat_bot/utils/const.dart';
// import 'package:dio/dio.dart';

// class ChatRepo {
//   static Future<String> chatTextGenerationRepo(
//       List<ChatMessageModel> previousMessages) async {
//     try {
//       Dio dio = Dio();

//       final response = await dio.post(
//           "https://deployment-for-dummies.onrender.com/process_text",
//           data: {
//             "contents": previousMessages.map((e) => e.toMap()).toList(),
//             "generationConfig": {
//               "temperature": 0.9,
//               "topK": 1,
//               "topP": 1,
//               "maxOutputTokens": 2048,
//               "stopSequences": []
//             },
//             "safetySettings": [
//               {
//                 "category": "HARM_CATEGORY_HARASSMENT",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               },
//               {
//                 "category": "HARM_CATEGORY_HATE_SPEECH",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               },
//               {
//                 "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               },
//               {
//                 "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
//                 "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//               }
//             ]
//           });
//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         return response
//             .data['candidates'].first['content']['parts'].first['text'];
//       }
//     } catch (e) {
//       print(e.toString());
//     }

//     // Add a return statement here to handle the case where  try block doesn't return anything.
//     return ''; // we can return a default value or throw an error as needed.
//   }
// }















// import 'package:chat_bot/models/chat_message.dart';
// import 'package:chat_bot/utils/const.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ChatRepo {
//   static Future<String> chatTextGenerationRepo(
//       List<ChatMessageModel> previousMessages, List<ChatMessageModel> messages) async {
//     try {
//       Dio dio = Dio();

//       final response = await dio.post(
//           "https://deployment-for-dummies.onrender.com/process_text",
//           options: Options(
//             headers: {
//               'Content-Type': 'application/json',
//             },
//           ),
//           data: {
//             "text": 'Text' // Example payload; you may need to adjust this according to your actual needs
//           });

//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         print("Response: ${response.data}"); // Print response
//         return response.data.toString(); // Adjust to return the correct part of the response
//       }
//     } catch (e) {
//       print("Error: $e");
//     }

//     // Add a return statement here to handle the case where try block doesn't return anything.
//     return ''; // We can return a default value or throw an error as needed.
//   }
// }






import 'package:chat_bot/models/chat_message.dart';
import 'package:chat_bot/utils/const.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(
      String inputMessage, List<ChatMessageModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final response = await dio.post(
          "https://deployment-for-dummies.onrender.com/process_text",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: {
            "text": inputMessage
          });

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print("Response: ${response.data}"); // Print response
        return response.data.toString(); // Adjust to return the correct part of the response
      }
    } catch (e) {
      print("Error: $e");
    }

    // Add a return statement here to handle the case where try block doesn't return anything.
    return ''; // We can return a default value or throw an error as needed.
  }
}





