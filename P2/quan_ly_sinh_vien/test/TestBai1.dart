import '../models/lop_hoc.dart';
import '../models/sinh_vien.dart';

void main() {
  var student = Student('Nguyen Van A', 20, 'SV001', 8.5);

  // print('Test getter: ${student.hoTen}');
  // student.hoTen = 'Nguyễn Văn B';
  // print('Test setter: ${student.hoTen}');
  // print('Xếp Loại: ${student.XepLoai()}');

  var lop = LopHoc('21DTHD5');
  lop.themSV(student);
  lop.themSV( Student('Nguyen Van B', 20, 'SV002', 5.5));
  lop.hienThiDanhSachSV();
}
