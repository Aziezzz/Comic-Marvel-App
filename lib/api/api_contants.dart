import 'dart:convert';
import 'package:crypto/crypto.dart';

class ApiConstants {
  // Ganti dengan kunci API Marvel Anda
  static const String publicKey = '1d7cb00caad9e2392d7efb4275ea7ef5';
  static const String privateKey = '8426d6d11b1aba6567f2d93ca4734fba884ea660';
  
  static const String baseUrl = 'https://gateway.marvel.com/v1/public/';
  
  // Timestamp atau string acak, bisa dibuat dinamis
  static const String ts = '1';

  // Marvel API memerlukan hash dari: ts + privateKey + publicKey
  // Metode ini bisa digunakan untuk membuat hash tersebut.
  static String getHash() {
    return md5.convert(utf8.encode('$ts$privateKey$publicKey')).toString();
  }
}
