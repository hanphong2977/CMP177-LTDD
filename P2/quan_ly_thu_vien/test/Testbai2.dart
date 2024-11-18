import '../models/doc_gia.dart';
import '../models/sach.dart';
import '../models/thu_vien.dart';

void main() {
  // Tạo đối tượng thư viện
  ThuVien thuVien = ThuVien();

  // Tạo sách
  Sach sach1 = Sach("S001","Lập trình Dart", "Nguyễn Văn A");
  Sach sach2 = Sach("S002","Học Flutter", "Trần Thị B");

  // Thêm sách vào thư viện
  print("\n__________________");
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);

  // Tạo độc giả
  DocGia docGia1 = DocGia("DG001", "Nguyễn Văn C");
  DocGia docGia2 = DocGia("DG002", "Lê Thị D");

  // Thêm độc giả vào thư viện
  print("\n__________________");
  thuVien.themDocGia(docGia1);
  thuVien.themDocGia(docGia2);

  // Hiển thị danh sách sách
  print("\n__________________");
  thuVien.hienThiDanhSachSach();

  // Kiểm tra mượn sách thành công
  print("\n__________________");
  docGia2.muonSach(sach1);
  thuVien.hienThiDanhSachSach();

  // Kiểm tra mượn sách thất bại
  print("\n__________________");
  docGia1.muonSach(sach1);

  // Kiểm tra trả sách thành công
  print("\n__________________");
  docGia2.traSach(sach1);

  // kiểm tra trả sách thất bại
  print("\n__________________");
  docGia2.traSach(sach2);
}