import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CustomBottomNavigation extends StatefulWidget {

  final int pageIndex;
  final Function changePage;
  CustomBottomNavigation({this.pageIndex,this.changePage});

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
            Icon(iconData,color: Colors.black54,size: ScreenUtil().setSp(75),),
            Text(labelText,
              style: TextStyle(
              color: Colors.black54,
              fontSize: ScreenUtil().setSp(45),
            ),
            )
          ],
        ):Column(
          children: [
            Icon(iconData,color: Colors.pink,size: ScreenUtil().setSp(75),),
            Text(labelText,
              style: TextStyle(
                color: Colors.pink,
                fontSize: ScreenUtil().setSp(45),
              ),
            )
          ],
        )
      ),
    );
  }

  checkForSelection(int index)
  {
    if(index == 0)
      {
        isHomeSelected = true;
        isMallSelected = false;
        isOrderSelected = false;
        isPersonalSelected = false;
        widget.changePage(index);
      }
    if(index == 1)
    {
      isHomeSelected = false;
      isMallSelected = true;
      isOrderSelected = false;
      isPersonalSelected = false;
      widget.changePage(index);

    }
    if(index == 2)
    {
      isHomeSelected = false;
      isMallSelected = false;
      isOrderSelected = true;
      isPersonalSelected = false;
    }
    if(index == 3)
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
            top: BorderSide(color: Colors.pink,width: 1,style: BorderStyle.solid),
          )
        ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavigationTiles(Icons.home, 'GoSwak',0,isHomeSelected),
            buildNavigationTiles(Icons.local_mall, 'Mall',1,isMallSelected),
            buildNavigationTiles(Icons.assignment, 'Orders',2,isOrderSelected),
            buildNavigationTiles(Icons.person, 'Personal',3,isPersonalSelected)
          ],
        ),
      ),
    );
  }
}
