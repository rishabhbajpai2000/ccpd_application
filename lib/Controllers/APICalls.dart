import 'dart:convert';

import 'package:file_picker/src/platform_file.dart';
import 'package:http/http.dart' as http;

import 'Utils.dart';

class APICalls {
  // this function will be called when the user clicks on the post job button
  // it will take the data from the text fields and send it to the backend
  // the backend will then store the data in the database
  static Future<int> postTheJob(
      {required String companyName,
      required String jobProfile,
      required String jobDescription,
      required String expectedCTC,
      required String registrationLink,
      required String jDLink,
      required String registrationEndDate}) async {
    print("companyName: $companyName");

    String startDate = Utils.getTheCurrentDate();

    // the body of the request
    Map<String, String> body = {
      "companyName": companyName,
      "jobDescription": jobDescription,
      "jobProfile": jobProfile,
      "expCTC": expectedCTC,
      "regLink": registrationLink,
      "startDate": startDate,
      "endDate": registrationEndDate,
      "file": jobDescription
    };

    String data = jsonEncode(body);

    // the headers of the request
    Map<String, String> headers = {"Content-type": "application/json"};

    // the request is sent to the backend
    final reponse = await http.post(
        Uri.parse("https://campus-ease.onrender.com/jobs"),
        headers: headers,
        body: data);

    int statusCode = reponse.statusCode;
    print("statusCode: $statusCode");
    Utils.showReleventToastMessageForJobPostingAPI(statusCode: statusCode);
    return statusCode;
  }

  Future<String> getTheJDLink({PlatformFile? file}) async {
    // TODO: will implement it after the firebase integration
    return "www.google.com";
  }
}
