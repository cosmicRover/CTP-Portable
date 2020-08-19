import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchUser{
  Future<User> fetchUser() async {
    final response =
    await http.get('https://tranquil-hollows-06480.herokuapp.com/user');

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body)[0]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class User {
  final String name;
  final String cohort;
  final String track;
  final double percentage_completed;
  final String profile_pic_url;

  const User({this.name, this.cohort, this.track, this.percentage_completed,
      this.profile_pic_url});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      cohort: json['cohort'],
      track: json['track'],
        percentage_completed: json['percentage_completed'],
        profile_pic_url: json['profile_pic_url']
    );
  }
}
