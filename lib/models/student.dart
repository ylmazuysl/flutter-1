class Student{
  String firstname,lastname,statement;
  int grade,id;
  String _status;

  Student.withID(int ids,String firstnames,String lastnames,String statements,int grades){
    this.id = ids;
    this.firstname = firstnames;
    this.lastname = lastnames;
    this.statement = statements;
    this.grade = grades;
  }

  Student(String firstnames,String lastnames,String statements,int grades){

    this.firstname = firstnames;
    this.lastname = lastnames;
    this.statement = statements;
    this.grade = grades;
  }

  Student.withoutInfo(){

  }

  void set setFirst(String value){
    this.firstname = value;
  }

  String get getStatus{
    String message = "";
    if (grade >= 50) {
      message = "geçtin";
    } else if (grade >= 40) {
      message = "bütünleme";
    } else {
      message = "başaramadın abi";
    }
    return message;
  }
}