import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes_mobile/Models/laporanharian.dart';

class LaporanForm extends StatefulWidget{
  final Laporan laporan;

  LaporanForm(this.laporan);

  @override
  LaporanFormState createState() => LaporanFormState(this.laporan);
}

class LaporanFormState extends State<LaporanForm>{
  Laporan laporan;
  LaporanFormState(Laporan laporan);

  TextEditingController dateController = TextEditingController();
  TextEditingController keteranganController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
   if(laporan != null){
     dateController.text = laporan.date;
     keteranganController.text = laporan.keterangan;
   }

   return Scaffold(
     appBar: AppBar(
       title: laporan == null ? Text('Add') : Text('Edit'),
       leading: Icon(Icons.keyboard_arrow_left),
   ),
   body: Padding(
     padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
     child: ListView(
      children: <Widget> [
      Padding (
        padding: EdgeInsets.only(top:20.0, bottom:20.0),
        child: TextField(
          controller: dateController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          labelText: 'Tanggal Laporan',
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
          controller: keteranganController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          labelText: 'Total Pendapatan Harian',
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
                  if (laporan == null) {
                  laporan = Laporan(dateController.text, keteranganController.text);
                } else {
                  laporan.date = dateController.text;
                  laporan.keterangan = keteranganController.text;
                }
                Navigator.pop(context, laporan);
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