import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _dienThoais = [];
  List<HoaDon> _hoaDons = [];

  //constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  // Setters
  set tenCuaHang(String value) => _tenCuaHang = (value.isNotEmpty)
      ? value
      : throw ArgumentError("Tên của hàng không để trống");
  set diaChi(String value) => _diaChi = (value.isNotEmpty)
      ? value
      : throw ArgumentError("Địa chỉ của hàng không để trống");

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    if (dienThoai.kiemTraCoTheBanKhong()) {
      _dienThoais.add(dienThoai);
      print('Điện thoại ${dienThoai.tenDienThoai} đã thêm thành công');
    } else {
      throw Exception('Không thể thêm điện thoại ${dienThoai.tenDienThoai}: Không hợp lệ hoặc không thể bán');
    }
  }

  // Cập nhật thông tin điện thoại
  void capNhatThongTinDienThoai(DienThoai dienThoai) {
    int index = _dienThoais.indexOf(dienThoai);
    if (index != -1) {
      _dienThoais[index] = dienThoai;
      print(
          'Thông tin điện thoại của ${dienThoai.tenDienThoai} đã cập nhật thành công');
    } else {
      print('Không tìm thấy điện thoại để cập nhật');
    }
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(DienThoai dienThoai) {
    int index = _dienThoais.indexOf(dienThoai);
    if (index != -1) {
      _dienThoais[index].coKinhDoanh = false;
      print(
          'Điện thoại ${dienThoai.tenDienThoai} đã ngừng kinh doanh thành công');
    } else {
      print('Không tìm thấy điện thoại để ngừng kinh doanh');
    }
  }

  // Tìm kiếm điện thoại theo mã
  List<DienThoai> timKiemDienThoaiTheoMa(String ma) {
    return _dienThoais
        .where((dt) => dt.maDienThoai.toLowerCase().contains(ma.toLowerCase()))
        .toList();
  }

  // Tìm kiếm điện thoại theo tên
  List<DienThoai> timKiemDienThoaiTheoTen(String ten) {
    return _dienThoais
        .where(
            (dt) => dt.tenDienThoai.toLowerCase().contains(ten.toLowerCase()))
        .toList();
  }

  // Tìm kiếm điện thoại theo hãng
  List<DienThoai> timKiemDienThoaiTheoHang(String hang) {
    return _dienThoais
        .where(
            (dt) => dt.hangSanXuat.toLowerCase().contains(hang.toLowerCase()))
        .toList();
  }

  // Hiển thị danh sách
  void hienThiDanhSachDienThoai() {
    print('Danh sách điện thoại của hàng:');
    for (var dienThoai in _dienThoais) {
      dienThoai.hienThiThongTin();
    }
  }

  // Tạo hóa đơn mới
  void taoHoaDon(HoaDon hoadon) {
    _hoaDons.add(hoadon);
    hoadon.dienThoaiDuocBan.soLuongTonKho -= hoadon.soLuongMua;
    print('Hóa đơn mới đã tạo thành công');
  }

  // Tìm kiếm hóa đơn theo mã
  List<HoaDon> timKiemHoaDonTheoMa(String ma) {
    return _hoaDons
        .where((hd) => hd.maHoaDon.toLowerCase().contains(ma.toLowerCase()))
        .toList();
  }

  // Tìm kiếm hóa đơn theo tên khách hàng
  List<HoaDon> timKiemHoaDonTheoTenKhachHang(String ten) {
    return _hoaDons
        .where(
            (hd) => hd.tenKhachHang.toLowerCase().contains(ten.toLowerCase()))
        .toList();
  }

  // Tìm kiếm hóa đơn theo ngày bán
  List<HoaDon> timKiemHoaDonTheoNgayBan(DateTime ngayBan) {
    return _hoaDons
        .where((hd) => hd.ngayBan.isAtSameMomentAs(ngayBan))
        .toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    print('Danh sách hóa đơn của hàng:');
    for (var hoaDon in _hoaDons) {
      hoaDon.hienThiThongTinHoaDon();
    }
  }

  double tinhTongDoanhThu(DateTime ngayBatDau, DateTime ngayKetThuc) {
    return _hoaDons
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau) && hd.ngayBan.isBefore(ngayKetThuc))
        .fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime ngayBatDau, DateTime ngayKetThuc) {
    return _hoaDons
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau) && hd.ngayBan.isBefore(ngayKetThuc))
        .fold(0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }

  Map<String, int> thongKeBanChay() {
    Map<String, int> thongKe = {};

    for (var hd in _hoaDons) {
      String maDienThoai = hd.dienThoaiDuocBan.maDienThoai;
      thongKe[maDienThoai] = (thongKe[maDienThoai] ?? 0) + hd.soLuongMua;
    }

    var topBanChay = thongKe.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Map.fromEntries(topBanChay);
  }

  Map<String, int> thongKeTonKho() {
    return _dienThoais
        .asMap()
        .map((_, dt) => MapEntry(dt.maDienThoai, dt.soLuongTonKho));
  }
}
