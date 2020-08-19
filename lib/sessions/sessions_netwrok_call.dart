import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class FetchSessions {
  Future<List<SessionsDataModel>> fetchSessions() async {
    final response =
        await http.get('https://tranquil-hollows-06480.herokuapp.com/sessions');

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((item) => SessionsDataModel.fromJson(item))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Sessions!!');
    }
  }
}

class SessionsDataModel {
  final String topic;
  final String session_date;
  final String instructor;
  final String session_detail;

  const SessionsDataModel(
      {this.topic, this.session_date, this.instructor, this.session_detail});

  factory SessionsDataModel.fromJson(Map<String, dynamic> json) {
    return SessionsDataModel(
        topic: json['topic'],
        session_date: json['session_date'],
        instructor: json['instructor'],
        session_detail: json['session_detail']);
  }
}
