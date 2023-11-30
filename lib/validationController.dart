import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:demo_project_00/My_Toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ValidationController extends GetxController{
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  var checkEmail=true.obs;
  var checkPass=true.obs;
  var encyp=false.obs;

  bool verifyPassword(String inputPassword, String hashedPassword) {
    var inputHash = encryptPassword(inputPassword);
    return inputHash == hashedPassword;
  }


  String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  bool isAlphanumeric(String password) {
    RegExp alphanumericRegExp = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumericRegExp.hasMatch(password);
  }

  bool isValidEmail(value){
    if(value.isEmpty){
      // MyToast.toast( 'Please enter a email address');
      checkEmail.value=true;
      return false;
    }else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      // MyToast.toast( 'Please enter a valid email address');
      checkEmail.value=true;
      return false;
    }else{
      return true;
    }
  }
  bool isValidPass(value){
    if (value.isEmpty) {
    checkPass.value=true;
    return false;
    }else if (value.length<10 || value.length>15) {
    checkPass.value=true;
    return false;
    }
    else if (isAlphanumeric(value)) {
    checkPass.value=true;
    return false;
    }else{
      return true;
    }
  }

  checkValidation(){
    if(emailController.text.isEmpty){
      MyToast.toast( 'Please enter a email address');
    }else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(emailController.text)) {
      MyToast.toast( 'Please enter a valid email address');
    }else  if (passwordController.text.isEmpty) {
      MyToast.toast( 'Please enter a Password');
    }else if (passwordController.text.length<10 || passwordController.text.length>15) {
      MyToast.toast( 'Password length should be between 10 to 15');
    } else if (isAlphanumeric(passwordController.text)) {
      MyToast.toast( 'Password should be Alphanumeric');
    } else{
      encyp.value=true;
      checkPass.value=false;
      checkEmail.value=false;
      passwordController.text=encryptPassword(passwordController.text);
    }
  }
}