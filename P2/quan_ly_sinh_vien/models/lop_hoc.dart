import 'sinh_vien.dart';

class LopHoc {
  String _tenLop;
  List<Student> _danhsachSV = [];

  LopHoc(this._tenLop);

  // Getter
  String get tenLop => _tenLop;
  List<Student> get danhsachSV => _danhsachSV;

  // Setter
  // set tenLop(String tenLop) {
  //   if (tenLop.isNotEmpty) {
  //     _tenLop = tenLop;
  //   }
  // }

  set tenLop(String tenLop) => _tenLop = (tenLop.isNotEmpty)? tenLop : _tenLop;

  // Thêm sinh viên vào danh sách
  void themSV(Student student) => _danhsachSV.add(student);

  // Hiển Thị Danh Sách Sinh Viên
  void hienThiDanhSachSV() {
    print('\n_________________');
    print('Danh Sach SV Lop: ${_tenLop}');
    for (var student in _danhsachSV) { 
      print("\n_________________");
      student.ViewStudent();
      print('\nXếp Loại: ${student.XepLoai()}');
    }
  }
}
