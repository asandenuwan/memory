import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class decaration {

  static BoxDecoration TitleAppBar(){
    return  BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 8,
            offset: Offset(0, 5),
            spreadRadius: 1
          ),
        ],
    );
  }

  static BoxDecoration CardDecaration(){
    return BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(15),
    );
  }

  static BoxDecoration summaryCard(){
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.deepPurpleAccent.shade100, Colors.blue.shade400],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }

  static BoxDecoration addJobButton(){
    return BoxDecoration(
        gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.blue]),
        borderRadius: BorderRadius.circular(20)
    );
  }

  static BoxDecoration InputContainers(){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3)
        )
      ]
    );
  }

  static InputDecoration TitleInput(){
    return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.lightBlueAccent.shade100,
        filled: true,
        hintText: "add job name eg: 'make pizza'"
    );
  }

  static InputDecoration DescriptionInput(){
    return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.white70,
        filled: true,
        hintText: "description\n\n  >get chees\n  >get flour\n  >get salt "
    );
  }

  static ButtonStyle AlarmSelectingBtn(int pageOfAlarm,int btn){
    return ButtonStyle(
        backgroundColor: (pageOfAlarm == btn)
            ? WidgetStatePropertyAll(
          Colors.green,
        )
            : WidgetStatePropertyAll(
          Colors.blueGrey,
        ),
        foregroundColor:
        WidgetStatePropertyAll(
          Colors.white,
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 15),
        )
    );

  }
}

class fontStyle{
  static TextStyle NormalFontStyle(bool isBlack){
    Color c;
    FontWeight w;
    if(isBlack){
      c=Colors.black;
      w=FontWeight.w500;
    }else{
      c=Colors.white;
      w=FontWeight.w700;
    }
    return TextStyle(
        fontSize: 20,
        fontWeight: w,
        color: c
    );
  }

  static TextStyle TabHeader(){
    return GoogleFonts.sourceSans3(
        fontWeight: .w600,
        fontSize: 30,
        color: Colors.white
    );
  }

  static TextStyle Header(){
    return TextStyle(
      fontSize: 30,
      fontWeight: .bold,
      color: Colors.white,
    );
  }
}
