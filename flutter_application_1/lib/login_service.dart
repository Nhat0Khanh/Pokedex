import 'package:dio/dio.dart';

class LoginService {
  Future<String?> loginApp(String username, String password) async {
    var dio = Dio();
    var url = 'https://dummyjson.com/auth/login';

    try {
      var response = await dio.post(
        url,
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // DummyJSON sử dụng 'accessToken' thay vì 'token'
        String token = response.data['accessToken']; 
        print("Đăng nhập DummyJSON thành công! Token: $token");
        return token;
      }
    } catch (e) {
      print("Lỗi đăng nhập: Sai tài khoản hoặc mật khẩu!");
      return null; 
    }
    return null;
  }
}