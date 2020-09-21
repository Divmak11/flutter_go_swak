import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttergoshak/screens/homepage.dart';
import 'package:fluttergoshak/screens/mall_page.dart';

class CustomBottomNavigation extends StatefulWidget {

  final int pageIndex;
  CustomBottomNavigation({this.pageIndex});

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {

  bool isMallSelected = false;
  bool isHomeSelected = true;
  bool isOrderSelected = false;
  bool isPersonalSelected = false;


  Widget buildNavigationTiles(IconData iconData,String labelText,int index,bool selectedPage) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checkForSelection(index);
        });

      },
      child: FittedBox(
        child: selectedPage == false ? Column(
          children: [
            Icon(iconData,color: Colors.black54,size: 25,),
            Text(labelText,
              style: TextStyle(
              color: Colors.black54,
              fontSize: ScreenUtil().setSp(25),
            ),
            )
          ],
        ):Column(
          children: [
            Icon(iconData,color: Colors.pink,size: 25,),
            Text(labelText,
              style: TextStyle(
                color: Colors.pink,
                fontSize: ScreenUtil().setSp(25),
              ),
            )
          ],
        )
      ),
    );
  }

  checkForSelection(int index)
  {
    if(index == 1)
      {
        isHomeSelected = true;
        isMallSelected = false;
        isOrderSelected = false;
        isPersonalSelected = false;
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> HomePage()));
      }
    if(index == 2)
    {
      isHomeSelected = false;
      isMallSelected = true;
      isOrderSelected = false;
      isPersonalSelected = false;
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MallPage()));
    }
    if(index == 3)
    {
      isHomeSelected = false;
      isMallSelected = false;
      isOrderSelected = true;
      isPersonalSelected = false;
    }
    if(index == 4)
    {
      isHomeSelected = false;
      isMallSelected = false;
      isOrderSelected = false;
      isPersonalSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(100),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.pink,width: 2,style: BorderStyle.solid),
          )
        ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavigationTiles(Icons.shopping_cart, 'GoSwak',1,isHomeSelected),
            buildNavigationTiles(Icons.local_mall, 'Mall',2,isMallSelected),
            buildNavigationTiles(Icons.assignment, 'Orders',3,isOrderSelected),
            buildNavigationTiles(Icons.person, 'Personal',4,isPersonalSelected)
          ],
        ),
      ),
    );
  }
}
