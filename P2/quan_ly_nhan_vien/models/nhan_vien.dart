class NhanVien {
  String _maNhanVien;
  String _tenNhanVien;
  double _luongCoBan;

  //construct
  NhanVien(this._maNhanVien, this._tenNhanVien, this._luongCoBan);

  //Getters
  String get maNhanVien => _maNhanVien;
  String get tenNhanVien => _tenNhanVien;
  double get luongCoBan => _luongCoBan;

  // Setters

  set maNhanVien(String value) => _maNhanVien = (value.isNotEmpty)? value:_maNhanVien;
  set tenNhanVien(String value) => _tenNhanVien = (value.isNotEmpty)? value:_tenNhanVien;
  set luongCoBan(double value) => _luongCoBan = (value >= 0)? value:_luongCoBan;

  // Tinh luong
  double tinhLuong() {
    return _luongCoBan;
  }
  // Hien Thi Thong Tin
  void hienThiThongTin() {
    print('Ma Nhan Vien: $maNhanVien');
    print('Ten Nhan Vien: $tenNhanVien');
    print('Luong Co Ban: $luongCoBan');
    print('Luong Phuc Lanh: ${tinhLuong()}');
  }
}