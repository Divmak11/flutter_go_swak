import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
class CustomBottomBar extends StatelessWidget {


  Widget buildPriceContainer(String text,String price,Color color,String side){
    return  Container(
      height: ScreenUtil().setHeight(85),
      width: ScreenUtil().setWidth(280),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: side == 'left' ? Radius.circular(ScreenUtil().setHeight(60)) :Radius.circular(0),
            bottomLeft: side == 'left' ? Radius.circular(ScreenUtil().setHeight(60)) :Radius.circular(0),
          topRight: side == 'right'? Radius.circular(ScreenUtil().setHeight(60)):Radius.circular(0),
          bottomRight: side=='right'?Radius.circular(ScreenUtil().setHeight(60)) :Radius.circular(0)
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().setHeight(8),),
          Align(
              alignment: Alignment.center,
              child: Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(32)))),
          Align(
              alignment: Alignment.center,
              child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(26)))),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.pink,width: 1,style: BorderStyle.solid),
          )
      ),
      height: ScreenUtil().setHeight(110),
      width: ScreenUtil.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Column(
              children: [
                Icon(Icons.headset_mic,size: ScreenUtil().setHeight(50),color: Colors.blueGrey,),
                Container(
                    height: ScreenUtil().setHeight(35),
                    width: ScreenUtil().setWidth(130),
                    child: Text(
                        'Chat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenUtil().setSp(25))))
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(90),
            width: ScreenUtil().setWidth(560),
            child: Row(
              children: [
            buildPriceContainer('Buy Now', 'P80', Colors.pink[200],'left'),
                buildPriceContainer('Group Buy', 'P28', Colors.pink,'right')
              ],
            ),
          )
        ],
      ),
    );
  }
}
