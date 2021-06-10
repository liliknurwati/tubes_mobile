class Laporan {
  int _id;
  String _date;
  String _keterangan;

  Laporan(this._id, this._date, this._keterangan);

  int get id => _id;
  String get date => _date;
  set date(String value)=>this._date=value;
  String get keterangan => _keterangan;
  set keterangan(String value)=>this._keterangan=value;
  

  Laporan.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._date = map['date'];
    this._keterangan = map['keterangan'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id']=this._id;
    map['date']= this._date;
    map['keterangan']= this._keterangan;
    return map;
  }
}