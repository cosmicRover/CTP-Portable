import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class FetchMentors {
  Future<List<MentorsDataModel>> fetchMentors() async {
    final response =
        await http.get('https://tranquil-hollows-06480.herokuapp.com/mentors');

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((item) => MentorsDataModel.fromJson(item))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Mentors!!');
    }
  }
}

class MentorsDataModel {
  final String name;
  final String position;
  final String picUrl;

  const MentorsDataModel({this.name, this.position, this.picUrl});

  factory MentorsDataModel.fromJson(Map<String, dynamic> json) {
    return MentorsDataModel(
        name: json['name'],
        position: json['position'],
        picUrl: json['picture']);
  }
}
