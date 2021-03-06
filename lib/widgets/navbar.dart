import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../constants/Theme.dart';

// import 'package:material_kit_flutter/screens/categories.dart';
// import 'package:material_kit_flutter/screens/best-deals.dart';
// import 'package:material_kit_flutter/screens/search.dart';
// import 'package:material_kit_flutter/screens/cart.dart';
// import 'package:material_kit_flutter/screens/chat.dart';

import 'input.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String add;
  final String notification;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final String titleSearch;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final List<String> tags;
  final Function getCurrentPage;
  final Function isOnSearch;
  final TextEditingController searchController;
  final Function searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;

  Navbar(
      {this.title = "Home",
      this.add = "",
      this.notification = "",
      this.categoryOne = "",
      this.categoryTwo = "",
      this.tags,
      this.transparent = false,
      this.rightOptions = true,
      this.getCurrentPage,
      this.searchController,
      this.isOnSearch,
      this.searchOnChanged,
      this.searchAutofocus = false,
      this.backButton = false,
      this.noShadow = false,
      this.bgColor = Colors.white,
      this.searchBar = false,
      this.titleSearch = ""});

  final double _prefferedHeight = 180.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag ="";

  ItemScrollController _scrollController = ItemScrollController();

  void initState() {
    if (widget.tags != null && widget.tags.length != 0) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool categories =
        widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;
    final String add = widget.add;
    final bool notification =
        widget.notification.isNotEmpty;
    final bool tagsExist =
        widget.tags == null ? false : (widget.tags.length == 0 ? false : true);

    return Container(
        height: widget.searchBar
            ? (!widget.searchBar ? (tagsExist ? 121.0 : 100.0)
            : (tagsExist ? 262.0 : 145.0))
            : (!widget.searchBar
            ? (tagsExist ? 132.0 : 102.0)
            : (tagsExist ? 200.0 : 100.0)),
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? Colors.black.withOpacity(0.6)
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: Offset(0, 5))
            ]),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                                !widget.backButton
                                    ? Icons.menu
                                    : Icons.arrow_back_ios,
                                color: !widget.transparent
                                    ? (widget.bgColor == Colors.white
                                        ? Colors.black
                                        : Colors.white)
                                    : Colors.white,
                                size: 24.0),
                            onPressed: () {
                              if (!widget.backButton)
                                Scaffold.of(context).openDrawer();
                              else
                                Navigator.pop(context);
                            }),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(widget.title,
                              style: TextStyle(
                                  color: !widget.transparent
                                      ? (widget.bgColor == Colors.white
                                          ? Colors.black
                                          : Colors.white)
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    if (widget.rightOptions)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Th??ng b??o");
                            },
                            child:  Row(
                              children: [
                                if (add!="")
                                IconButton(
                                      icon: Icon(Icons.add,
                                          color: !widget.transparent
                                              ? (widget.bgColor == Colors.white
                                              ? Colors.black
                                              : Colors.white)
                                              : Colors.white,
                                          size: 22.0),
                                      onPressed: (){
                                        switch(add) {
                                          case "agent": {

                                          }
                                          break;
                                          case "customer": {

                                          }
                                          break;
                                          default: {
                                            //statements;
                                          }
                                          break;
                                        }
                                      }
                                  ),
                                if (notification)
                                IconButton(
                                    icon: Icon(Icons.notifications_none,
                                        color: !widget.transparent
                                            ? (widget.bgColor == Colors.white
                                            ? Colors.black
                                            : Colors.white)
                                            : Colors.white,
                                        size: 22.0),
                                    onPressed: (){
                                      print("Notifi");
                                    }),

                              ],
                            ),
                          ),
                        ],
                      )
                  ],
                ),
                if (widget.searchBar)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 4, left: 15, right: 15),
                    // child: Search(
                    //     placeholder: widget.titleSearch,
                    //     controller: widget.searchController,
                    //     onChanged: widget.searchOnChanged,
                    //     autofocus: widget.searchAutofocus,
                    //     suffixIcon:
                    //         Icon(Icons.search, color: MaterialColors.muted),
                    //     onTap: widget.isOnSearch,
                    //     ),
                  ),
                SizedBox(
                  height: tagsExist ? 0 : 10,
                ),
                if (categories)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Categories()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.border_all,
                                color: Colors.black87, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryOne,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0)),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        color: MaterialColors.muted,
                        height: 25,
                        width: 0.3,
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BestDeals()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_enhance,
                                color: Colors.black87, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryTwo,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0)),
                          ],
                        ),
                      )
                    ],
                  ),
                if (tagsExist)
                  Container(
                    height: 40,
                    child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.tags.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (activeTag != widget.tags[index]) {
                              setState(() => activeTag = widget.tags[index]);
                              _scrollController.scrollTo(
                                  index:
                                      index == widget.tags.length - 1 ? 1 : 0,
                                  duration: Duration(milliseconds: 420),
                                  curve: Curves.easeIn);
                              if (widget.getCurrentPage != null)
                                widget.getCurrentPage(activeTag);
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 46 : 8, right: 8),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2.0,
                                          color: activeTag == widget.tags[index]
                                              ? MaterialColors.primary
                                              : Colors.transparent))),
                              child: Center(
                                child: Text(widget.tags[index],
                                    style: TextStyle(
                                        color: activeTag == widget.tags[index]
                                            ? MaterialColors.primary
                                            : MaterialColors.placeholder,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0)),
                              )),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}
