import 'dart:io';

void main() {
  // Khai bao bien co ban
  var ten = 'Bao'; // tu suy luan kieu String

  int tuoi = 21; // Khai bao ro rang kieu

  // Su dung null safety
  String? tenNullable;
  tenNullable = null; // Cho phep null

  // Su dung bien late
  late String moTa;
  moTa = 'Lap trinh Dart';

  // Su dung final va const
  final String quocgia = 'VietNam';
  const int nam = 2024;

  // In gia tri bien
  print('Ten: $ten');
  print('Tuoi: $tuoi');
  print('Mo ta: $moTa');
  print('Quoc gia: $quocgia');
  print('Nam: $nam');

  // Kiem tra bien Nullable
  int? soLuong;
  assert(soLuong == null);
}
