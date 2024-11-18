import 'doc_gia.dart';
import 'sach.dart';

class ThuVien {
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  // Getter
  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  // Phương thức thêm sách vào thư viện
  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print("Đã thêm sách: ${sach.tenSach}");
  }

  // Phương thức thêm độc giả vào thư viện
  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print("Đã thêm độc giả: ${docGia.tenDocGia}");
  }

  // Phương thức hiển thị danh sách sách
  void hienThiDanhSachSach() {
    print("Danh sách sách trong thư viện:");
    for (var sach in _danhSachSach) {
      sach.hienThiThongTinSach();
    }
  }
}