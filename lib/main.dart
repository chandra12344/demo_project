import 'package:demo_project_00/validationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'My_Toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValidationController validationController = Get.put(ValidationController());
  bool visible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Check Authorization'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Obx(
                  ()=> TextFormField(
                    onChanged: (value){
                      setState(() {

                      });
                      if(validationController.isValidEmail(value)){
                        validationController.checkEmail.value=false;
                      }
                    },
                    controller: validationController.emailController,
                    decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: validationController.checkEmail.value?Colors.redAccent: Colors.greenAccent, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: validationController.checkEmail.value?Colors.redAccent: Colors.greenAccent, width: 2.0),
                        ),
                        hintText: 'Enter Email',
                        isDense: true),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Obx(
                  ()=> TextFormField(
                    onChanged: (value){
                      setState(() {
                      });
                      if(validationController.isValidPass(value)){
                        validationController.checkPass.value=false;
                      }
                    },
                    obscureText: visible,
                    controller: validationController.passwordController,
                    decoration:  InputDecoration(
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color:validationController.checkPass.value?Colors.redAccent: Colors.greenAccent, width: 2.0),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color:validationController.checkPass.value?Colors.redAccent: Colors.greenAccent, width: 2.0),
                      ),
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(
                        icon: Icon( visible?Icons.visibility_off_outlined:Icons.visibility_outlined),
                        onPressed: (){
                          setState(() {
                            if(!validationController.encyp.value){
                            visible =!visible;
                            }
                          });
                        },),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      visible=true;
                      setState(() {

                      });
                      validationController.checkValidation();
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.blue // Background Color
                        ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
