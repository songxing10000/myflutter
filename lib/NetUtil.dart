import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
export 'package:dio/dio.dart' show DioError;
import 'package:flutter/foundation.dart';
import 'TokenInfo.dart';
import 'UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetUtil {
  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  NetUtil([this.context]) {
    _options = Options(extra: {"context": context});
    init();
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = new Dio(BaseOptions(
    followRedirects: true,
    baseUrl: 'https://college.91hilife.com/xtedu/',
    headers: {
      HttpHeaders.authorizationHeader:
          'Basic ' + 'aWRfODE5MDM3Mzg4NTIxOTU4ODMxNzoxNjA1OTY5MzQ3',
    },
  ));

  static void init() {
    if (!kDebugMode) {
      return;
    }
    // 调试模式
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // 代理ip
      // client.findProxy = (uri) {
      //   return 'PROXY 192.168.0.102:8888';
      // };
      //禁用HTTPS证书校验
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  /// 用户登录
  Future<TokenInfo> login(String? phone, String? pwd) async {
    Map<String, String?> dict = Map();
    dict['grant_type'] = 'password';
    dict['password'] = pwd;
    dict['scope'] = 'all';
    dict['username'] = phone;

    FormData formData = FormData.fromMap(dict);

    var r = await dio.post("https://college.91hilife.com/oauth2/oauth/token",
        data: formData);

    TokenInfo tokenObj = TokenInfo.fromJson(r.data);

    if (tokenObj.accessToken != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', tokenObj.accessToken!);
      //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
      dio.options.headers['college-token'] = tokenObj.accessToken!;
    }

    return tokenObj;
  }

  /// 获取用户信息
  Future<UserInfo> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');

    Map<String, String?> dict = Map();
    dict['token'] = token;

    FormData formData = FormData.fromMap(dict);

    var r = await dio.post("/api/cas/getUserInfoByToken", data: formData);
    return UserInfo.fromJson(r.data);
  }
}
