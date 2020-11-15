class StudentValidationMixin {

  String validatorFirstName(String giris){
    if(giris.length<2)
      return "İsim en az 2 karakterli olmalı";
  }

  String validatorLastName(String giris){
    if(giris.length<2)
      return "Soyad en az 2 karakterli olmalı";
  }

  String validatorGrade(String giris){
    var grade = int.parse(giris);
    if(grade<0 || grade>100)
      return "Not 0 ile 100 arası olmalıdır.";
  }

}