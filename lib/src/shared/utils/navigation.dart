import 'package:flutter_modular/flutter_modular.dart';

import '../../features/list/data/models/errors_model.dart';

class VakaRoute {
  static Future<bool?> navAdd() {
    return Modular.to.pushNamed(
      '/add',
    );
  }

  static Future<bool?> navListErrors() {
    return Modular.to.pushNamed(
      '/list_errors',
    );
  }

  static Future<bool?> navDetail(ErrorsModel error) {
    return Modular.to.pushNamed(
      '/detail',
      arguments: <String, ErrorsModel>{
        'error': error,
      },
    );
  }

  static Future<Object?> navCrypto(
      // {
      // DetailParams? detailParams,
      // }
      ) {
    return Modular.to.pushNamed(
      '/crypto/',
      // arguments: {
      //   'params': detailParams,
      // },
    );
  }

  static Future<Object?> navTopupSelectReplacement() {
    return Modular.to.pushReplacementNamed(
      '/topup_select/',
    );
  }

  static Future<Object?> navReceiptReplacement() {
    return Modular.to.pushReplacementNamed(
      '/receipt/',
    );
  }

  static Future<Object?> navTopUpPayment() {
    return Modular.to.pushNamed(
      '/topup/',
    );
  }

  static Future<Object?> navSettings() {
    return Modular.to.pushNamed(
      '/settings/',
    );
  }

  static Future<Object?> navReceipt() {
    return Modular.to.pushNamed(
      '/receipt/',
    );
  }

  static Future<Object?> navQrCodeReplacement() {
    return Modular.to.pushReplacementNamed(
      '/qrcode/',
    );
  }

  static Future<Object?> navQrCode() {
    return Modular.to.pushNamed(
      '/qrcode/',
    );
  }

  static Future<Object?> navLoading() {
    return Modular.to.pushNamed(
      '/loading/',
    );
  }

  static Future<Object?> navUpimages() {
    return Modular.to.pushReplacementNamed(
      '/upimages/',
    );
  }

  static Future<Object?> navInfo() {
    return Modular.to.pushReplacementNamed(
      '/info/',
    );
  }

  static Future<Object?> navLanding() {
    return Modular.to.pushReplacementNamed(
      '/landing',
    );
  }

  static Future<Object?> navHome() {
    return Modular.to.pushReplacementNamed(
      '/home',
    );
  }

  static Future<Object?> navOrderReplacement() {
    return Modular.to.pushReplacementNamed(
      '/orders',
    );
  }

  static Future<Object?> navOrders() {
    return Modular.to.pushNamed(
      '/orders',
    );
  }

  static Future<Object?> navDetailOrder({required int id}) async {
    return Modular.to.pushNamed(
      '/detail_order',
      arguments: <String, int>{
        'id': id,
      },
    );
  }

  static Future<Object?> navDetailOrderReplacement({required int id}) async {
    return Modular.to.pushReplacementNamed(
      '/detail_order',
      arguments: <String, int>{
        'id': id,
      },
    );
  }

  static Future<Object?> navCreateOrder() {
    return Modular.to.pushNamed(
      '/create_order',
    );
  }

  static Future<Object?> navLogin() {
    return Modular.to.pushReplacementNamed(
      '/login',
    );
  }

  static Future<Object?> navHomeReload() {
    return Modular.to.pushNamedAndRemoveUntil(
      '/',
      (dynamic route) => false,
    );
  }

  static Future<Object?> navReprint() {
    return Modular.to.pushReplacementNamed(
      '/reprint/',
    );
  }

  static Future<Object?> landingAuth() {
    return Modular.to.pushNamed(
      '/auth/landingAuth/',
    );
  }

  static Future<Object?> printAuth() {
    return Modular.to.pushNamed(
      '/auth/print/',
    );
  }

  static Future<Object?> printAuthPin() {
    return Modular.to.pushNamed(
      '/auth/pinAuth/',
    );
  }

  static Future<Object?> cameraAuth() {
    return Modular.to.pushNamed(
      '/auth/camera/',
    );
  }

  static Future<Object?> navRates() {
    return Modular.to.pushNamed(
      '/rates',
    );
  }

  static Future<Object?> validateTerms() {
    return Modular.to.pushNamed(
      '/validate_terms/',
    );
  }

  static Future<Object?> navQrCodePushNamed() {
    return Modular.to.pushNamed(
      '/qrcode/',
    );
  }
}
