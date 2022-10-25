import 'package:dartlearnig/src/core/services/BCrypt/configBCrypt.dart';
import 'package:test/test.dart';

void main() {
  final String password = "Go7/flo2";
  final String hash = "\$2a\$10\$H4CUF3e8.FHunvCNpCwkSO2LzSLqDE7EoA9Pz3rGQtayJZP.lneLO";
  test('generateBCrypt ...', () async {
    final result = ConfigBCrypt().generateBCrypt(password);
    print(result);
  });

  test("verifyBCrypt", () async {
    final result =
        ConfigBCrypt().veridyBCrypt(password: password, passHash: hash);
    print(result);
    expect(result, true);
  });
}
