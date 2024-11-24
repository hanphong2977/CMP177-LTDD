class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _coKinhDoanh;

  //construct
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._coKinhDoanh);

  // Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get coKinhDoanh => _coKinhDoanh;

  // Setters
  set maDienThoai(String maDienThoai) => _maDienThoai =
      (maDienThoai.isEmpty || !RegExp(r'^DT-\d{3}$').hasMatch(maDienThoai))
          ? throw ArgumentError("Mã điện thoại phải có định dạng 'DT-XXX'.")
          : maDienThoai;
  set tenDienThoai(String tenDienThoai) =>
      _tenDienThoai = (tenDienThoai.isNotEmpty)
          ? tenDienThoai
          : throw ArgumentError("Tên điện thoại không được để trống");
  set hangSanXuat(String hangSanXuat) => _hangSanXuat = (hangSanXuat.isNotEmpty)
      ? hangSanXuat
      : throw ArgumentError("Tên hãng không được để trống");
  set giaNhap(double giaNhap) =>
      _giaNhap = (giaNhap > 0) ? giaNhap : throw ArgumentError("Giá nhập > 0");
  set giaBan(double giaBan) => _giaBan = (giaBan > 0 && giaBan > _giaNhap)
      ? giaBan
      : throw ArgumentError("Giá bán phải lớn hơn 0 và lớn hơn giá nhập.");
  set soLuongTonKho(int soLuongTonKho) => _soLuongTonKho = (soLuongTonKho >= 0)
      ? soLuongTonKho
      : throw ArgumentError("Số lượng tồn kho >= 0");
  set coKinhDoanh(bool coKinhDoanh) => _coKinhDoanh = coKinhDoanh;

  // Tính lợi nhuận dự kiến
  double tinhLoiNhuan() => _giaBan - _giaNhap;

  // hiển thị thông tin
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTonKho');
    print(
        'Kinh doanh: ${_coKinhDoanh ? 'Còn kinh doanh' : 'Ngừng kinh doanh'}');
    // print('Lợi nhuận: ${tinhLoiNhuan()}');
  }

  // Kiểm tra có thể bán không
  bool kiemTraCoTheBanKhong() {
    if (_soLuongTonKho <= 0 || !_coKinhDoanh) return false;
    return true;
  }
}
