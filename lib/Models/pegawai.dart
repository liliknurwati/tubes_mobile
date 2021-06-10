class Pegawai {
  int _id;
  String _name;
  String _posisi;
  String _phone;

  Pegawai(this._name, this._posisi, this._phone);

  int get id => _id;
  String get name => _name;
  set name(String value)=>this._name=value;
  String get posisi => _posisi;
  set posisi(String value)=>this._posisi=value;
  String get phone => _phone;
  set phone(String value)=>this._phone=value;

  Pegawai.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._posisi = map['posisi'];
    this._phone = map['phone'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id']=this._id;
    map['name']= this._name;
    map['posisi']= this._posisi;
    map['phone']= this._phone;
    return map;
  }
}