import 'package:flutter/material.dart';

class Person {
  String? person_img;
  String? nick;
  String? city;
  bool? is_follower;
  Color followerColor = Colors.blue.shade900;
  String? followerText;
  String? status;
  String? sale;
  String? media_publication;
  String? auth;
  String? description;

  void setPersonImg(String person_img) {
    this.person_img = person_img;
  }

  void setNick(String nick) {
    this.nick = nick;
  }

  void setIsFollower(bool is_follower) {
    this.is_follower = is_follower;
  }

  void setFollowerCollor(Color followerColor) {
    this.followerColor = followerColor;
  }

  void setFollowerText(String followerText) {
    this.followerText = followerText;
  }

  void setCity(String city) {
    this.city = city;
  }

  void setStatus(String status) {
    this.status = status;
  }

  void setSale(String sale) {
    this.sale = sale;
  }

  void setMediaPublication(String media_publication) {
    this.media_publication = media_publication;
  }

  void setAuth(String auth) {
    this.auth = auth;
  }

  void setDescription(String description) {
    this.description = description;
  }

  Person(
      {this.person_img,
      this.nick,
      this.city,
      this.is_follower,
      // this.followerColor,
      this.followerText,
      this.status,
      this.sale,
      this.auth,
      this.description});
}
