
import 'package:flutter/material.dart';
import 'burc_detay.dart';
import 'burc_liste.dart';

void main(List<String> args) => runApp(MyApp());
  
  class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListesi",   //uygulamada hata filan çıkarsa bu sayfadan başlicak

      routes: {
        "/": (context)=>BurcListesi(),
        "/burcListesi": (context)=>BurcListesi(),
        
      },

      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");  //  /  burcDetay  /  0          //(ilk elemana tıkladıysam) 0 (2. el..)1
        if(pathElemanlari[1] == "burcDetay"){
          return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElemanlari[2])));
        } 
        return  null;
      },

      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
     // home:BurcListesi() , routes varsa hom olmaz
    );
  }
}