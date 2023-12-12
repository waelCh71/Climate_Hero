import '../../../global/constante.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Utulity: receive data from web and pass it to the repositry

class ChallengesServices {


  Future<List> getChallenges() async {
    //print("\nhiiiii");
    var prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString("jwtToken");
    var headers = {'Authorization': jwtToken};
    //var data = json.encode({"email": email, "password": password});
    var dio = Dio();
    var response = await dio.request(
      '${baseURL}challange/challanges',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
    //print("\nhiiiii 2");

    //print("response ${response.statusCode}");
    if (response.statusCode == 200) {
      print("\nhiiiii 3");
      return response.data;
    } else if (response.statusCode == 401) {
      print(response.statusMessage);
      return [];
    } else {
      throw Error();
    }
  }

}
