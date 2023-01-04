import 'package:animagieeui/utils/Urls/urlsapi.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/instancepage/model/post_creation/select_group.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GroupService {
  static final client = http.Client();

  static Future<SelectGroup?> groupService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    String baseUrl = (prefs.getString('url') ?? Urls.baseUrl);
    try {
      var response = await client.get(Uri.parse(Urls.selectgroup), headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzOWMwNjc2YmQ5OGFiZTI1OGQ1ZDM1YiIsImVtYWlsb3JwaG9uZSI6InNhdGhpc2hAZ21haWwuY29tIiwiaWF0IjoxNjcxMjU1NTczfQ.KmD4Jp7PxuH2-zSS-TEnopJvPi3bhTZkNilaTFx1yDQ',
      });
      print(response.body);
      if (response.statusCode == 200) {
        return selectGroupFromJson(response.body);
    
      } else {
        return null;
      }
    } catch (e) {
      
      print('yes${e}');
      return null;
    }
  }
}


       