import 'package:deneme/models/student.dart';
import 'package:deneme/screens/student_add.dart';
import 'package:deneme/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Merhaba yılmaz";

  Student selectedStudent = Student.withID(0,"","","",0);

  List<Student> students = [
    Student.withID(
        1,
        "MUHTEŞEM IŞILTI",
        "KANATLI SİNEK",
        "Bu nefeskesici sinekleri ormanlarda akarsuları üzerinde uçuştuklarını sıkça görebiliriz.",
        25),
    Student.withID(
        2,
        "Kum Sanatçısı ",
        "Yengeç",
        "Nature’s Sand Artist: Sand Bubbler Crab  – Kum sanatçısı – Kum kabarcığı yengeci1-Resimde gördüğünüz kum rengi küçük yengeçlerin adı kum kabarcığı yengeci. Bu ismi almasının sebebi rengi değil, kumlara verdiği enteresan şekiller. Hepiniz kum sanatçılarının kumlara verdiği güzel şekilleri görmüşsünüzdür. Bu kez sanatçımız 1 cm çapındaki bir yengeç.",
        65),
    Student.withID(
        3,
        "Karpuza Benzeyen ",
        "Tırtıl",
        "Bu tırtılın ismi “Green Slug Caterpillar (Eloasa symphonistis)” . Biz ona “karpuz görünümlü tırtıl” diyebiliriz. Güve olmadan önceki bu karpuz görünümüyle, diğer canlılardan korunuyor. Bu muhteşem kamuflajı ona üstün akıl sahibi Allah vermiştir.",
        45)
  ];

  var ogrenciler = [
    "yılamz uysal",
    "umarrem ince",
    "başaramadım abi",
    "ne bilim"
  ];

  @override
  Widget build(BuildContext istedigim) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(istedigim),
    );
  }

  void ogrenci() {
    var ogrenciler = [
      "yılamz uysal",
      "umarrem ince",
      "başaramadım abi",
      "ne bilim"
    ];
  }

  void mesajGoster(BuildContext istedigim, String err) {
    var alert = AlertDialog(
      title: Text("Sonuc bakma!!1"),
      content: Text(err),
    );
    showDialog(context: istedigim, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext istedigim) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext istedigim, int hapsu) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://imanhakikatleri.com/wp-content/uploads/2018/01/Vestalis_amethystina_Lieftinck_1965-1024x576.jpg"),
                    ),
                    title: Text(students[hapsu].firstname +
                        " " +
                        students[hapsu].lastname),
                    subtitle: Text(students[hapsu].statement +
                        " Sınav sonucları : " +
                        students[hapsu].grade.toString() +
                        "[" +
                        students[hapsu].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[hapsu].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[hapsu];
                      });
                      print(selectedStudent.firstname);
                    },
                  );
                })),
        Text("secili ogrencı" + selectedStudent.firstname),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amber,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(hapsu)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.black12,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(hapsu)=>StudentEdit(selectedStudent)));
                },
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: RaisedButton(
                color: Colors.blue,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var err = "Silindi  :"+selectedStudent.firstname;
                  mesajGoster(istedigim, err);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.add_alert);
    }
  }
}
