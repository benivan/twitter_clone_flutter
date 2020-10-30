import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocialInterceptor extends InterceptorContract{

  SocialInterceptor();

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async{
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      final jwtToken = sharedPreferences.get("Authorization");
      data.headers["Authorization"] = jwtToken;
    }catch(e){
      print(e);
    }
    return data;
  }

  @override
  Future<RequestData> interceptRequest({RequestData data}) async{
    if(data.headers["Authorization"] != null){
      await SharedPreferences.getInstance().then((sp) => {
        sp.setString("Authorization", data.headers["Authorization"])
      });
    }
    return data;
  }
}
