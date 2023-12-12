
import 'package:flutter/material.dart';

class Utils {
  
  void navigationForword(context, x) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => x));
}

void navigationBack(context, x) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => x));
}

void snackBarShow(String x,int t,Color cl){
    SnackBar snackBar = SnackBar(backgroundColor: cl,
      content: Text(x,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
      duration: Duration(seconds: t),
    );
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}