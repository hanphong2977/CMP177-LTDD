class Sach {
  String _maSach;
  String _tenSach;
  String _tenTacGia;
  bool _coMuon = false;

  Sach(this._maSach, this._tenSach, this._tenTacGia);

  // Setter
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tenTacGia => _tenTacGia;
  bool get coMuon => _coMuon;

  // Setter
  set maSach(String value) => _maSach = (value.isNotEmpty)? value: _maSach;
  set tenSach(String value) => _tenSach = (value.isNotEmpty)? value: _tenSach;
  set tenTacGia(String value) => _tenTacGia = (value.isNotEmpty)? value: _tenTacGia;
  set coMuon(bool value) => _coMuon = value;

  void hienThiThongTinSach(){
    print('Ma Sach: ${_maSach}');
    print('Ten Sach: ${_tenSach}');
    print('Ten Tac Gia: ${_tenTacGia}');
    print('Co Muon: ${_coMuon? 'Da Muon' : 'Chua Muon'}');
  }
}