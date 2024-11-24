import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

class Test {
  // Thuộc tính lưu trữ cửa hàng
  final CuaHang cuaHang = CuaHang("The Gioi Di Dong", "Tp.HCM");

  /// Kiểm tra chức năng quản lý điện thoại
  void testQuanLyDienThoai() {
    print("\n--- Test Quản lý Điện Thoại ---");

    // Thêm điện thoại mới
    try {
      cuaHang.themDienThoai(DienThoai("DT-001", "iPhone 14", "Apple", 20000, 25000, 10, true));
      cuaHang.themDienThoai(DienThoai("DT-002", "Galaxy S23", "Samsung", 15000, 18000, 5, true));
      cuaHang.themDienThoai(DienThoai("DT-003", "Xiaomi 13", "Xiaomi", 10000, 12000, 8, true));
      print("Thêm điện thoại thành công!");
    } catch (e) {
      print("Lỗi khi thêm điện thoại: $e");
    }

    // Cập nhật thông tin điện thoại
    try {
      var dtCanSua = cuaHang.timKiemDienThoaiTheoMa("DT-001").first;
      dtCanSua.tenDienThoai = "iPhone 14 Pro";
      dtCanSua.giaNhap = 22000; // Giá nhập mới
      print("Cập nhật thông tin thành công!");
    } catch (e) {
      print("Lỗi khi cập nhật thông tin điện thoại: $e");
    }

    // Kiểm tra validation
    try {
      cuaHang.themDienThoai(DienThoai("", "Invalid", "Unknown", -1000, 500, -10, false));
    } catch (e) {
      print("Validation hoạt động: $e");
    }
  }

  /// Kiểm tra chức năng quản lý hóa đơn
  void testQuanLyHoaDon() {
    print("\n--- Test Quản lý Hóa Đơn ---");

    // Tạo hóa đơn hợp lệ
    try {
      var dt1 = cuaHang.timKiemDienThoaiTheoMa("DT-001").first;
      cuaHang.taoHoaDon(HoaDon("HD-001", DateTime(2024, 11, 15), dt1, 2, 25000, "Nguyen Van A", "0123456789"));
      print("Hóa đơn hợp lệ được thêm thành công!");
    } catch (e) {
      print("Lỗi khi thêm hóa đơn: $e");
    }

    // Tạo hóa đơn không hợp lệ (tồn kho không đủ)
    try {
      var dt2 = cuaHang.timKiemDienThoaiTheoMa("DT-002").first;
      cuaHang.taoHoaDon(HoaDon("HD-002", DateTime(2024, 11, 16), dt2, 10, 18000, "Nguyen Van B", "0987654321"));
    } catch (e) {
      print("Validation tồn kho hoạt động: $e");
    }

    // Tính toán tiền và lợi nhuận
    try {
      var tongTien = cuaHang.tinhTongDoanhThu(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
      var loiNhuan = cuaHang.tinhTongLoiNhuan(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
      print("Tổng doanh thu: $tongTien");
      print("Tổng lợi nhuận: $loiNhuan");
    } catch (e) {
      print("Lỗi khi tính toán: $e");
    }
  }

  /// Kiểm tra chức năng thống kê báo cáo
  void testThongKeBaoCao() {
    print("\n--- Test Thống Kê Báo Cáo ---");

    // Doanh thu theo thời gian
    var doanhThu = cuaHang.tinhTongDoanhThu(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
    print("Doanh thu từ 14/11/2024 đến 16/11/2024: $doanhThu");

    // Lợi nhuận theo thời gian
    var loiNhuan = cuaHang.tinhTongLoiNhuan(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
    print("Lợi nhuận từ 14/11/2024 đến 16/11/2024: $loiNhuan");

    // Thống kê top bán chạy
    var topBanChay = cuaHang.thongKeBanChay();
    print("Top điện thoại bán chạy:");
    topBanChay.forEach((ma, sl) {
      print("Mã điện thoại: $ma, Số lượng: $sl");
    });

    // Báo cáo tồn kho
    var tonKho = cuaHang.thongKeTonKho();
    print("Báo cáo tồn kho:");
    tonKho.forEach((ma, sl) {
      print("Mã điện thoại: $ma, Số lượng tồn kho: $sl");
    });
  }
}

void main() {
  print("\n=== BẮT ĐẦU KIỂM THỬ ===");
  Test test = Test();

  test.testQuanLyDienThoai();
  test.testQuanLyHoaDon();
  test.testThongKeBaoCao();

  print("\n=== KẾT THÚC KIỂM THỬ ===");
}
