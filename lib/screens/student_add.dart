import 'package:deneme/models/student.dart';
import 'package:deneme/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget{
  List<Student> students;
  StudentAdd(List<Student> studentss){
    this.students = studentss;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudetAddState(students);
  }
}

class _StudetAddState extends State<StudentAdd> with StudentValidationMixin{
  var student = Student.withoutInfo();
  var formkey = GlobalKey<FormState>();

  List<Student> students;
  _StudetAddState(List<Student> studentsss){
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
      decoration: InputDecoration(labelText: "Öğrenci adı",hintText: "Yılmaz"),
      validator: validatorFirstName,
      onSaved: (String giris){
        student.firstname = giris;
      },
    );
  }

  buildLandNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "Uysal"),
      validator: validatorLastName,
      onSaved: (String giris){
        student.lastname = giris;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not",hintText: "40"),
      validator: validatorGrade,
      onSaved: (String giris){
        student.grade = int.parse(giris);
      },
    );
  }

  buildStatementsField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "içerik",hintText: "İman hAkikatleri"),
      onSaved: (String giris){
        student.statement = giris;
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formkey.currentState.validate()){
          formkey.currentState.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.firstname);
    print(student.lastname);
    print(student.grade);
  }





}