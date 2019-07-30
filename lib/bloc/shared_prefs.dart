import 'dart:async';
import 'dart:core';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// var query2 = Firestore.instance.collection('/society');
var l5 = 0, l4 = 0;

class SharedPrefs {
  Future<bool> authenticate({@required guard}) async {
    // var c = await query2.where('password', isEqualTo: guard).snapshots().first;
    // l5 = c.documents.length;

    if (l5 == 1) l4 = 1;
    return l4 == 1 ? true : false;
  }

  Future<String> hasPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var guard = prefs.getString("guard");
    print("Pwd in shared preffs = $guard");
    return guard;
  }

  Future<void> writePassword(String pwd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Pwd that is being set = $pwd");
    prefs.setString("guard", pwd);
    await Future.delayed(Duration(seconds: 1));
  }

  Future<void> deletePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Email being deleted = ${prefs.getString("guard")}");
    prefs.remove("guard");
    await Future.delayed(Duration(seconds: 1));
  }
}
