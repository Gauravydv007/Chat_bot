import 'dart:math';

import 'package:chat_bot/models/chat_message.dart';
import 'package:chat_bot/utils/const.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(
      List<ChatMessageModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final response = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${apiKey}",
          data: {
            "contents": previousMessages.map((e) => e.toMap()).toList(),
            "generationConfig": {
              "temperature": 0.9,
              "topK": 1,
              "topP": 1,
              "maxOutputTokens": 2048,
              "stopSequences": []
            },
            "safetySettings": [
              {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              }
            ]
          });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response
            .data['candidates'].first['content']['parts'].first['text'];
      }
    } catch (e) {
      print(e.toString());
    }

    // Add a return statement here to handle the case where  try block doesn't return anything.
    return ''; // we can return a default value or throw an error as needed.
  }
}















// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:chat_bot/models/chat_message.dart';
// import 'package:chat_bot/utils/const.dart';
// import 'package:dio/dio.dart';

// class ChatRepo {
//   static Future<String> chatTextGenerationRepo(
//       List<ChatMessageModel> previousMessages, String? base64Image) async {
//     try {
//       Dio dio = Dio();

//       FormData formData = FormData.fromMap({
//         "contents": previousMessages.map((e) => e.toMap()).toList(),
//         "generationConfig": {
//           "temperature": 0.9,
//           "topK": 1,
//           "topP": 1,
//           "maxOutputTokens": 2048,
//           "stopSequences": []
//         },
//         "safetySettings": [
//           {
//             "category": "HARM_CATEGORY_HARASSMENT",
//             "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//           },
//           {
//             "category": "HARM_CATEGORY_HATE_SPEECH",
//             "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//           },
//           {
//             "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
//             "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//           },
//           {
//             "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
//             "threshold": "BLOCK_MEDIUM_AND_ABOVE"
//           }
//         ]
//       });

//       if (base64Image != null) {
//         Uint8List bytes = base64Decode(base64Image);
//         formData.files.add(MapEntry(
//           "image",
//           MultipartFile.fromBytes(
//             bytes,
//             filename: "image.jpg",
//           ),
//         ));
//       }

//       final response = await dio.post(
//         // "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${apiKey}",
//         "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro-vision-latest:generateContent?key=${apiKey}",
//         data: formData,
//       );

//       if (response.statusCode! >= 200 && response.statusCode! < 300) {
//         return response.data['candidates'].first['content']['parts'].first['text'];
//       } else {
//         throw Exception('Failed to generate text');
//       }
//     } catch (e) {
//       throw Exception('Failed to generate text: $e');
//     }
//   }
// }

