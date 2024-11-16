import 'dart:io';
import 'dart:math';

void main() {
  print("Giải phương trình bậc 2: ax² + bx + c = 0");

  while (true) {
    // Nhập hệ số a
    double a;
    while (true) {
      stdout.write("Nhập hệ số a (a ≠ 0): ");
      String? input = stdin.readLineSync();

      // Kiểm tra giá trị nhập bằng tryParse
      double? parsedValue = double.tryParse(input ?? '');
      if (parsedValue != null) {
        if (parsedValue != 0) {
          a = parsedValue;
          break;
        } else {
          print("Hệ số a phải khác 0. Vui lòng nhập lại.");
        }
      } else {
        print("Giá trị nhập không hợp lệ. Vui lòng nhập một số.");
      }
    }

    // Nhập hệ số b
    stdout.write("Nhập hệ số b: ");
    double b = double.parse(stdin.readLineSync() ?? "0");

    // Nhập hệ số c
    stdout.write("Nhập hệ số c: ");
    double c = double.parse(stdin.readLineSync() ?? "0");

    // Giải phương trình
    solveQuadraticEquation(a, b, c);

    // Hỏi người dùng có muốn tiếp tục hay không
    stdout.write("\nBạn có muốn giải phương trình khác? (y/n): ");
    String? continueInput = stdin.readLineSync();
    if (continueInput == null || continueInput.toLowerCase() != 'y') {
      print("Cảm ơn bạn đã sử dụng chương trình. Tạm biệt!");
      break;
    }
  }
}

void solveQuadraticEquation(double a, double b, double c) {
  print("\nPhương trình: ${a}x² + ${b}x + $c = 0");

  // Tính Delta
  double delta = b * b - 4 * a * c;
  print("Delta = ${delta.toStringAsFixed(2)}");

  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print("Phương trình có hai nghiệm phân biệt:");
    print("x1 = ${x1.toStringAsFixed(2)}");
    print("x2 = ${x2.toStringAsFixed(2)}");
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print("Phương trình có nghiệm kép: x = ${x.toStringAsFixed(2)}");
  } else {
    double realPart = -b / (2 * a);
    double imaginaryPart = sqrt(-delta) / (2 * a);
    print("Phương trình có hai nghiệm phức:");
    print(
        "x1 = ${realPart.toStringAsFixed(2)} + ${imaginaryPart.toStringAsFixed(2)}i");
    print(
        "x2 = ${realPart.toStringAsFixed(2)} - ${imaginaryPart.toStringAsFixed(2)}i");
  }
}
