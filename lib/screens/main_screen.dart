import 'package:appkt/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //PageController _pageController;
  int _page = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:  Home(),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outlined),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets),
              title: Container(height: 0.0),
            ),
          ],
          onTap: (int index) {
            this.onTapHandler(index);
          },
        ),
      ),
    );
  }

  void onTapHandler(int index)  {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}

//   void onPageChanged(int page) {
//     setState(() {
//       this._page = page;
//     });
//   }
// }
