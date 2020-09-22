import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttergoshak/screens/homepage.dart';
import 'package:fluttergoshak/screens/mall_page.dart';
import 'package:fluttergoshak/widgets/bottom_navgation.dart';
class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String,Object>> _pages;
  int _selectedPageIndex=0;


  @override
  void initState() {
    _pages=[
      {
        'page': HomePage(),
      },
      {
        'page':MallPage(),
      }
    ];
    super.initState();
  }

  void selectPage(int index)
  {
    print(index);
    setState(() {
      _selectedPageIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: CustomBottomNavigation(pageIndex: _selectedPageIndex,changePage: selectPage,),
      ),
    );
  }
}
