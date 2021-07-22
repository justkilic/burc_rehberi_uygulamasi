
import 'package:burc_rehberi_uygulamasi/burc_detay.dart';
import 'package:flutter/material.dart';
import 'models/burc.dart';
import 'utils/strings.dart';

class BurcListesi extends StatelessWidget {

 static List<Burc> tumBurclar;

  
  
    @override
    Widget build(BuildContext context) {

     tumBurclar=veriKaynaginiHazirla();
      
            return Scaffold(
              appBar: AppBar(
                title: Text("Burç Rehberi"),
              ),
              body: listeyiHazirla(),
                          );
                        }
                    
                      List<Burc> veriKaynaginiHazirla() {
              
                        List<Burc> burclar=[];
              
                        for(int i=0; i<12; i++){
              
                          String kucukResim=Strings.BURC_ADLARI[i].toLowerCase()+"${i+1}.png";  //Koc->koc1.png               /*statik olmasaydı (Strings)'e erişmek için String s=Strings(); s.*/
                          String buyukResim=Strings.BURC_ADLARI[i].toLowerCase()+"_buyuk"+"${i+1}.png"; //Koc->koc_buyuk1.png
              
                          Burc eklenecekBurc=Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i], Strings.BURC_GENEL_OZELLIKLERI[i], kucukResim, buyukResim);
                          burclar.add(eklenecekBurc);
                        }
              
                        return burclar;   // verileri çektikten sonra local bir listeye atayıp listenizi hazırlıyosunuz Genel olarak mantık böle
              
                      }
              
          Widget listeyiHazirla() {

            return ListView.builder(itemBuilder: (BuildContext context, int index){
              return tekSatirBurc(context, index);
                          },
                          itemCount:tumBurclar.length,);
              
                        }
              
                Widget tekSatirBurc(BuildContext context, int index) {

                  Burc oanListyeEklenenBurc=tumBurclar[index];

                  return Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
                        //onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>BurcDetay())),
                        leading: Image.asset("images/"+oanListyeEklenenBurc.burcKucukResim, width: 64, height: 64,),
                        title: Text(oanListyeEklenenBurc.burcAdi, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.pink.shade500),),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(oanListyeEklenenBurc.burcTarihi, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black38),),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink,),
                      ),
                    ),
                  );
                }
  
    
}