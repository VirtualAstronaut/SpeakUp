import 'package:flutter/material.dart';
import 'package:speak_up/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

class ListOfLanguageCodes {
  static const List<Map> listOfCode = [
    {"lang": "Afrikaans", "code": "af"},
    {"lang": "Albanian", "code": "sq"},
    {"lang": "Arabic", "code": "ar"},
    {"lang": "Azerbaijani", "code": "az"},
    {"lang": "Basque", "code": "eu"},
    {"lang": "Belarusian", "code": "be"},
    {"lang": "Bengali", "code": "bn"},
    {"lang": "Bulgarian", "code": "bg"},
    {"lang": "Catalan", "code": "ca"},
    // {"lang": "Chinese Simplified", "code": "zh-CN"},
    // {"lang": "Chinese Traditional", "code": "zh-TW"},
    {"lang": "Croatian", "code": "hr"},
    {"lang": "Czech", "code": "cs"},
    {"lang": "Danish", "code": "da"},
    {"lang": "Dutch", "code": "nl"},
    {"lang": "English", "code": "en"},
    {"lang": "Esperanto", "code": "eo"},
    {"lang": "Estonian", "code": "et"},
    {"lang": "Filipino", "code": "tl"},
    {"lang": "Finnish", "code": "fi"},
    {"lang": "French", "code": "fr"},
    {"lang": "Galician", "code": "gl"},
    {"lang": "Georgian", "code": "ka"},
    {"lang": "German", "code": "de"},
    {"lang": "Greek", "code": "el"},
    {"lang": "Gujarati", "code": "gu"},
    {"lang": "Haitian Creole", "code": "ht"},
    {"lang": "Hebrew", "code": "iw"},
    {"lang": "Hindi", "code": "hi"},
    {"lang": "Hungarian", "code": "hu"},
    {"lang": "Icelandic", "code": "is"},
    {"lang": "Indonesian", "code": "id"},
    {"lang": "Irish", "code": "ga"},
    {"lang": "Italian", "code": "it"},
    {"lang": "Japanese", "code": "ja"},
    {"lang": "Kannada", "code": "kn"},
    {"lang": "Korean", "code": "ko"},
    {"lang": "Latin", "code": "la"},
    {"lang": "Latvian", "code": "lv"},
    {"lang": "Lithuanian", "code": "lt"},
    {"lang": "Macedonian", "code": "mk"},
    {"lang": "Malay", "code": "ms"},
    {"lang": "Maltese", "code": "mt"},
    {"lang": "Norwegian", "code": "no"},
    {"lang": "Persian", "code": "fa"},
    {"lang": "Polish", "code": "pl"},
    {"lang": "Portuguese", "code": "pt"},
    {"lang": "Romanian", "code": "ro"},
    {"lang": "Russian", "code": "ru"},
    {"lang": "Serbian", "code": "sr"},
    {"lang": "Slovak", "code": "sk"},
    {"lang": "Slovenian", "code": "sl"},
    {"lang": "Spanish", "code": "es"},
    {"lang": "Swahili", "code": "sw"},
    {"lang": "Swedish", "code": "sv"},
    {"lang": "Tamil", "code": "ta"},
    {"lang": "Telugu", "code": "te"},
    {"lang": "Thai", "code": "th"},
    {"lang": "Turkish", "code": "tr"},
    {"lang": "Ukrainian", "code": "uk"},
    {"lang": "Urdu", "code": "ur"},
    {"lang": "Vietnamese", "code": "vi"},
    {"lang": "Welsh", "code": "cy"},
    {"lang": "Yiddish", "code": "yi"}
  ];
}
