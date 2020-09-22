import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
class ProductItem extends StatelessWidget {

  final String productImagePath;
  final String title;
  final String amount;
  final String soldUnits;

  ProductItem({this.productImagePath,this.title,this.amount,this.soldUnits});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.asset(productImagePath,
                fit: BoxFit.cover,
                height:ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(280),
            ),
          ),
          Text(title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Colors.black,fontWeight: FontWeight.w500),
          ),

          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setHeight(18)),
            child: Row(
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
                Text(
                  '$soldUnits sold',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: ScreenUtil().setSp(25),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
