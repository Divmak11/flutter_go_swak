import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CouponItem extends StatelessWidget {

  final String label;
  final String imagePath;
  final String sendUnits;
  final String amount;
  final String soldUnits;
  final List<String> soldUnitsUserImages;

  CouponItem(
      {@required this.label,
      @required this.imagePath,
      @required this.sendUnits,
      @required this.amount,
      @required this.soldUnits,
      @required this.soldUnitsUserImages});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(300),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              child: Image.asset(
                imagePath,
                height: ScreenUtil().setHeight(250),
                width: ScreenUtil().setWidth(300),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(15),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(8),
                    ),
                    Text(
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(32),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(8),
                    ),
                    soldUnitsUserImages.length == 0?
                    Container() :
                    Container(
                      height: ScreenUtil().setHeight(25),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: soldUnitsUserImages.length,
                        itemBuilder: (ctx,index)=> ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            soldUnitsUserImages[index],
                            height: ScreenUtil().setHeight(30),
                            width: ScreenUtil().setWidth(30),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(8),
                    ),
                    int.parse(soldUnits) == 0 ? Container(): Text(
                      '$soldUnits sold',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(8),
                    ),
                    int.parse(sendUnits)==0? Container() : Text(
                      '$sendUnits send',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'P$amount',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(40),
                          ),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(60),
                          width: ScreenUtil().setWidth(200),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.pink,
                                  Colors.pinkAccent,
                                  Colors.redAccent,
                                ],
                              )),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Redeem',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontSize: ScreenUtil().setSp(25)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(8),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
