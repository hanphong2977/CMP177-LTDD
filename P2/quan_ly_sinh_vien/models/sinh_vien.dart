class Student {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  // constructor
  Student(this._hoTen, this._tuoi, this._maSV, this._diemTB);

  // Getter
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSV;
  double get diemTB => _diemTB;

  // Setter
  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi) {
    if (tuoi > 0) {
      _tuoi = tuoi;
    }
  }

  set maSV(String maSV) {
    if (maSV.isNotEmpty) {
      _maSV = maSV;
    }
  }

  set diemTB(double diemTB) {
    if (diemTB >= 0 && diemTB <= 10) {
      _diemTB = diemTB;
    }
  }

  void ViewStudent() {
    print("Họ tên: $_hoTen");
    print("Tuổi: $_tuoi");
    print("Mã Số Sinh Viên: $_maSV");
    print("Điểm TB: $_diemTB");
  }

  String XepLoai() {
    if (_diemTB >= 8.0) {
      return "Giỏi";
    } else if (_diemTB >= 6.5) {
      return "Khá";
    } else if (_diemTB >= 5.0) {
      return "Trung bình";
    } else {
      return "Yếu";
    }
  }
}
