import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes_mobile/Models/pegawai.dart';

class PegawaiForm extends StatefulWidget{
  final Pegawai pegawai;

  PegawaiForm(this.pegawai);

  @override
  PegawaiFormState createState() => PegawaiFormState(this.pegawai);
}

class PegawaiFormState extends State<PegawaiForm>{
  Pegawai pegawai;
  PegawaiFormState(Pegawai pegawai);

  TextEditingController nameController = TextEditingController();
  TextEditingController posisiController = TextEditingController(); 
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   if(pegawai != null){
     nameController.text = pegawai.name;
     posisiController.text = pegawai.posisi;
     phoneController.text = pegawai.phone;
   }

   return Scaffold(
     appBar: AppBar(
       title: pegawai == null ? Text('Add') : Text('Edit'),
       leading: Icon(Icons.keyboard_arrow_left),
   ),
   body: Padding(
     padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
     child: ListView(
      children: <Widget> [
      Padding (
        padding: EdgeInsets.only(top:20.0, bottom:20.0),
        child: TextField(
          controller: nameController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          labelText: 'Nama Pegawai',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
      onChanged: (value) {
      }
        ),
      ),

      Padding (
        padding: EdgeInsets.only(top:20.0, bottom:20.0),
        child: TextField(
          controller: posisiController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          labelText: 'Posisi Pegawai',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
      onChanged: (value) {
      }
        ),
      ),

      Padding (
        padding: EdgeInsets.only(top:20.0, bottom:20.0),
        child: TextField(
          controller: phoneController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          labelText: 'No. Telepon Pegawai',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
      onChanged: (value) {
      }
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top:20.0, bottom:20.0),
        child: Row(
          children: <Widget> [
            Expanded(
              child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text(
                  'Save',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  if (pegawai == null) {
                  pegawai = Pegawai(nameController.text, posisiController.text, phoneController.text);
                } else {
                  pegawai.name = nameController.text;
                  pegawai.posisi = posisiController.text;
                  pegawai.phone = phoneController.text;
                }
                Navigator.pop(context, pegawai);
                },
              ),
            ),
            Container(width: 5),
            Expanded(
              child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text(
                  'Cancel',
                textScaleFactor: 1.5,
                ),
                onPressed: () {
                 Navigator.pop(context);
                }
              ),
            ),
          ],     
        ),
      )
      ],
      ),
   ),
   );

  }
}