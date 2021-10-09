import 'dart:io';
import 'package:appkt/screens/main_screen.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'constants/common.dart';
import 'fade_animation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _LoginState();
  }
}

class _LoginState extends State<Login> with WidgetsBindingObserver{
  String userName = '';
  String passWord = '';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String dvcs = '';
  List listDVCS = [];

  @override
  Future<bool> fetchListDVCS() async {
    print(1);
    final response = await http.get(Uri.parse('https://demoketoan.vaonline.vn/api/System/GetDvcsByUser?username='+userName.toLowerCase()));
    List<dynamic> body = jsonDecode(response.body);
    print(body);
    setState(() {
      listDVCS = body;
      dvcs = listDVCS[0]['id'];
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<String> login() async {
    String notification;
    final response = await http.post(
      Uri.parse('https://demoketoan.vaonline.vn/api/Account/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": userName.toUpperCase(),
        "pass": passWord,
        "dvcs": dvcs.toUpperCase(),
        "captcha_token":""
      }),
    );
    Map<String, dynamic> map = json.decode(response.body);
    print(map['token']);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', map['token']);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
    return 'a';
  }

  void validate(){
      login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Form(
                          //autovalidate: true,
                            key: formkey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                  ),
                                  child: TextFormField(
                                    validator: RequiredValidator(errorText: "Hãy nhập tên đăng nhập"),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Tên truy cập",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    onChanged: (text){
                                        setState(() {
                                          userName = text;
                                        });
                                        fetchListDVCS();
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: RequiredValidator(errorText: "Hãy nhập mật khẩu"),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mật khẩu",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    obscureText: true,
                                    onChanged: (text){
                                      setState(() {
                                        passWord = text;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),

                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                        border: InputBorder.none,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: dvcs,
                                          isDense: true,
                                          onChanged: (text){
                                            setState(() {
                                              dvcs = text.toString();
                                            });
                                          },
                                          items: listDVCS.map((item) => DropdownMenuItem(
                                              child: Text(item['id']),
                                              value: item['id'],
                                            ),
                                          ).toList(),
                                        ),
                                      ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      )),
                      SizedBox(height: 30,),
                      FadeAnimation(2, Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red
                        ),
                        child: FlatButton(
                          onPressed: () {
                            validate();
                          },
                          child: Text("Đăng nhập",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),
                      SizedBox(height: 70,),
                      FadeAnimation(1.5, Text("Quên mật khẩu?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}