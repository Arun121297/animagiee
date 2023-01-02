import 'dart:convert';
import 'dart:developer';

import '../../../utils/Urls/urlsapi.dart';
import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
import '../model/signinreg.dart';

class SigninService {
  Future<SigninRegister?> signinservice({email, username}) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var token = sharedPr } else {

    // log("token-->$token");
    try {
      var data = {'emailorphone': email, 'username': username};

      log(data.toString());
      var response = await http.post(Uri.parse(Urls.login), body: data);
      var jsonresponse;

      if (response.statusCode == 200 || response.statusCode == 201) {
        jsonresponse = json.decode(response.body);
        // print('animagiee');

        // jsonresponsedcode = jsonDecode(jsonresponse);

        // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        log(jsonresponse.toString());
        return SigninRegister.fromJson(jsonresponse);
        //  else {
        //   log('failure-------------------------------');
        //   log('${jsonresponse['message']}');
        //   Get.back();
        //   // Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        // }
      } else {
        return null;
      }

      // // var data = {
      // //   "emailorphone": email,
      // //   "username": username,
      // // };
      // // log("Signindatas-->$data");
      // var headers = {'Content-Type': 'application/json'};
      // var request = http.Request(
      //     'POST', Uri.parse('192.168.1.32:9000/api/user/registersandlogin'));
      // request.body = json.encode({"emailorphone": email, "username": username});
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();
      // var jsonresponse;

      // if (response.statusCode == 200) {
      //   // print(await response.stream.bytesToString());
      //   jsonresponse = jsonDecode(request.body);
      //   if (jsonresponse['status'] == "success") {
      //     Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      //     return SigninRegister.fromJson(jsonresponse);
      //   } else {
      //     Fluttertoast.showToast(msg: jsonresponse['message'].toString());
      //     return null;
      //   }
      // } else {
      //   print(response.reasonPhrase);
      // }
    } catch (e) {
      log("error$e");
      rethrow;
    }
  }
}
