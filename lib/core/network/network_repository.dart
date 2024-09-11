import 'dart:async';
import 'package:dio/dio.dart';
import 'package:meditationapp/core/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meditationapp/main.dart';

Future<bool> apicAll(String filePath, String url) async {
  if (await AppUtils.checkInterAvailability()) {
    debugPrint('baseUrl--$filePath');
    final response = await Dio().download(url, filePath);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } else {
    noInterNetPopUp();
    return false;
  }
}

void noInterNetPopUp() {
  AppUtils.snackBarFnc(
    ctx: navigatorKey.currentState!.context,
    contentText: 'Internet Is not available!',
  );
}