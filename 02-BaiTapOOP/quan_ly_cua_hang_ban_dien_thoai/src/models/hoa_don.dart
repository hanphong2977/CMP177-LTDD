import 'dien_thoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  //constructor
  HoaDon(
      this._maHoaDon,
      this._ngayBan,
      this._dienThoaiDuocBan,
      this._soLuongMua,
      this._giaBanThucTe,
      this._tenKhachHang,
      this._soDienThoaiKhach);

  // Getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;

  // Setters
  set maHoaDon(String value) =>
      _maHoaDon = (value.isNotEmpty || RegExp(r'^HD-\d{3}$').hasMatch(value))
          ? value
          : throw ArgumentError(
              "Mã hóa đơn không được để trống và phải có định dạng 'HD-XXX");
  set ngayBan(DateTime value) => _ngayBan = (!value.isAfter(DateTime.now()))
      ? value
      : throw ArgumentError("Ngày bán không được sao ngày hiện tại");
  set dienThoaiDuocBan(DienThoai value) => _dienThoaiDuocBan = value;
  set soLuongMua(int value) =>
      _soLuongMua = (value > 0 && value <= _dienThoaiDuocBan.soLuongTonKho)
          ? value
          : throw ArgumentError("Số lượng mua > 0 và <= số lượng tồn kho");
  set giaBanThucTe(double value) => giaBanThucTe =
      (value > 0) ? value : throw ArgumentError("Giá bán thực tế > 0");
  set tenKhachHang(String value) => _tenKhachHang = (value.isNotEmpty)
      ? value
      : throw ArgumentError("Tên khách hàng không được để trống");
  set soDienThoaiKhach(String value) => _soDienThoaiKhach = (value.isNotEmpty &&
          RegExp(r'^0\d{9}$').hasMatch(value))
      ? value
      : throw ArgumentError(
          "Số điện thoại khách hàng phải có định dạng '0XXXXXXXXX' và không được để trống");
  
  // Tính tổng tiền
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  // Tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() => (_giaBanThucTe - _dienThoaiDuocBan.giaNhap)*_soLuongMua;

  // Hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon(){
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: ${_ngayBan.toLocal()}");
    print("Điện thoại đã bán: ${_dienThoaiDuocBan.maDienThoai}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: ${_giaBanThucTe}");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách hàng: $_soDienThoaiKhach");
    print("Tổng tiền: ${tinhTongTien()}");
    // print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }
}
