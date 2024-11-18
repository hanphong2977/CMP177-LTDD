import 'sach.dart';

class DocGia {
  String _maDocGia;
  String _tenDocGia;
  List<Sach> _danhSachMuon = [];

  DocGia(this._maDocGia, this._tenDocGia);

  // Getter
  String get maDocGia => _maDocGia;
  String get tenDocGia => _tenDocGia;

  // Setter
  set maDocGia(String value) =>
      _maDocGia = (value.isNotEmpty) ? value : _maDocGia;
  set tenDocGia(String value) =>
      _tenDocGia = (value.isNotEmpty) ? value : _tenDocGia;

  void muonSach(Sach sach) {
    if (!sach.coMuon) {
      _danhSachMuon.add(sach);
      sach.coMuon = true;
      print('Sách được mượn thành công!');
    }
    else {
      print('Sách đã được mượn!');
    }
  }

  void traSach(Sach sach) {
    if (sach.coMuon) {
      _danhSachMuon.remove(sach);
      sach.coMuon = false;
      print('Sách đã trả thành công!');
    }
    else {
      print('Sách không mượn!');
    }
  }
}
