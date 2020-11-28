import 'package:flutter/material.dart';
import 'package:temel_widget/data/mainbackupstudent.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/product_list.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
    );
  }
  
}