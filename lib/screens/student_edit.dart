import 'package:deneme/models/student.dart';
import 'package:deneme/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget{
  Student selectedStudents;
  StudentEdit(Student studentss){
    this.selectedStudents = studentss;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudetAddState(selectedStudents);
  }
}

class _StudetAddState extends State with StudentValidationMixin{
  var formkey = GlobalKey<FormState>();

  Student students;
  _StudetAddState(Student studentsss){
    this.students = studentsss;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLandNameField(),
              buildGradeField(),
              buildStatementsField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: students.firstname,
      decoration: InputDecoration(labelText: "Öğrenci adı",hintText: "Yılmaz"),
      validator: validatorFirstName,
      onSaved: (String giris){
        students.firstname = giris;
      },
    );
  }

  buildLandNameField() {
    return TextFormField(
      initialValue: students.lastname,
      decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Uysal"),
      validator: validatorLastName,
      onSaved: (String giris){
        students.lastname = giris;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: students.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı not",hintText: "40"),
      validator: validatorGrade,
      onSaved: (String giris){
        students.grade = int.parse(giris);
      },
    );
  }

  buildStatementsField() {
    return TextFormField(
      initialValue: students.statement,
      decoration: InputDecoration(labelText: "içerik",hintText: "İman hAkikatleri"),
      onSaved: (String giris){
        students.statement = giris;
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formkey.currentState.validate()){
          formkey.currentState.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(students.firstname);
    print(students.lastname);
    print(students.grade);
  }





}