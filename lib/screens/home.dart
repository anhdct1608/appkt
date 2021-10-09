import 'dart:convert';
import 'dart:io';
import 'package:appkt/widgets/navbar.dart';
import 'package:appkt/widgets/product_item.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Home extends StatefulWidget {
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}
class _HomeState extends State<Home> with WidgetsBindingObserver{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Trang chủ",
        bgColor: Colors.red,
      ),
      body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitleRow(),
                Container(
                    child: LicenseGrid(),
                ),
              ],
            ),
          )
      ),
    );
  }
}

buildTitleRow() {
  return Container(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Báo cáo",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "View More",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}

class LicenseGrid extends StatelessWidget {
  //String licenseCf, licenseIcf;
  //LicenseGrid({this.licenseCf,this.licenseIcf});
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      child: Column(
        children: <Widget>[
          Flexible(
            child: FlatButton(
              onPressed: () {
                  Alert(
                      context: context,
                      title: "Sổ chi tiết CN",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Tài khoản',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Mã ngoại tệ',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Mã ngoại tệ',
                            ),
                          ),
                          Text("${selectedDate.toLocal()}".split(' ')[0]),
                          SizedBox(height: 20.0,),
                          RaisedButton(
                            onPressed: () => _selectDate(context),
                            child: Text('Select date'),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () => print("Post"),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                },
              child:
              Row(
                children: [
                  _buildStatCard('Sổ chi tiết công nợ', "", Colors.green),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Popular Products",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "View More",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  // buildProductList() {
  //   return Container(
  //     height: 140.0,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       shrinkWrap: true,
  //       itemCount: furnitures.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map furniture = furnitures[index];
  //
  //         return ProductItem(
  //           color: Colors.green,
  //           title: "Sổ chi tiết công nợ",
  //
  //         );
  //       },
  //     ),
  //   );
  // }
}
