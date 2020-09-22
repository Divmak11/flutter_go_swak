import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttergoshak/model/dummy_data.dart';
import 'package:fluttergoshak/widgets/bottom_navgation.dart';
import 'package:fluttergoshak/widgets/product_item.dart';

import 'product_detail.dart';
class MallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setHeight(14)),
          child: Column(
            children: [
              Container(
                height: ScreenUtil().setHeight(70),
                width: ScreenUtil().setWidth(700),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Search  GoSwak',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: ScreenUtil().setSp(35)
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(15),),
              Container(
                height: ScreenUtil().setHeight(100),
                width:  ScreenUtil().setWidth(1000),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(35)
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30),),
                      Text(
                        'Women\'s Apparel',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: ScreenUtil().setSp(35)
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30),),
                      Text(
                        'Bags & Accessories',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: ScreenUtil().setSp(35)
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30),),
                      Text(
                        'Top Frenzy',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: ScreenUtil().setSp(35)
                        ),
                      ),
                  ],),
                ),
              ),
              SizedBox(height: ScreenUtil().setSp(12),),
              GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: ProductData().products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  ),
                  itemBuilder: (ctx,index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx)=> ProductDetails(
                              ProductData().products[index].id
                            )));
                        },
                      child: ProductItem(
                        title: ProductData().products[index].productTitle,
                        amount: ProductData().products[index].amount,
                        productImagePath: ProductData().products[index].imagePath,
                        soldUnits: ProductData().products[index].soldUnits,
                      ),
                    );
                  })
            ],
          ),
        ),
      )
      ),
    );
  }
}
