import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students){
    this.students=students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student= Student.withoutInfo();
  var formKey=GlobalKey<FormState>();
  _StudentAddState(List<Student> students){
    this.students=students;
  }
  
  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child : Form(
          key: formKey,
         child: Column(
           children: <Widget>[
             buildFirstNameField(),
             buildLastNameField(),
             buildGradeField(),
             buildSubmitButton(),
           ],
         ),
        ),
      )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Engin"),
      validator: validateFirstName,
      onSaved: (String value){
        student.firstName=value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci SoyAdı", hintText: "Demiroğ"),
      validator: valideLastName,
      onSaved: (String value){
        student.lastName=value;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String value){
        student.grade=int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child : Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
