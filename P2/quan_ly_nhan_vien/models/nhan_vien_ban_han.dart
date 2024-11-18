import 'nhan_vien.dart';

class NhanVienBanHang extends NhanVien{
  double _doanhSo;
  double _hoaHong;

  // constructor
   NhanVienBanHang(String maNV, String hoTen, double luongCoBan, this._doanhSo,
      this._hoaHong)
      : super(maNV, hoTen, luongCoBan);

  // Getters
  double get doanhSo => _doanhSo; 
  double get hoaHong => _hoaHong;

  // Setters
  set doanhSo(double value) => _doanhSo = (value >= 0)? value : _doanhSo;
  set hoaHong(double value) => _hoaHong = (value >= 0 && value <= 1)? value : _hoaHong;

  @override
  double tinhLuong(){
    return luongCoBan + (_doanhSo * _hoaHong);
  }

  @override
  void hienThiThongTin(){
    super.hienThiThongTin();
    print('Doanh so: $_doanhSo');
    print('Hoa hong: ${_hoaHong*100}%');
  }
}