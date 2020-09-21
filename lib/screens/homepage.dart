import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttergoshak/constants.dart';
import 'package:fluttergoshak/model/dummy_data.dart';
import 'package:fluttergoshak/widgets/bottom_navgation.dart';
import 'package:fluttergoshak/widgets/coupon_item.dart';
class HomePage extends StatelessWidget {

  //Common widget build for simple written product features
  Widget buildFeature(String text,IconData icon)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Icon(icon,size: 18,color: Colors.grey),
       Text(text,
       style: TextStyle(
         color: Colors.grey,
         fontWeight: FontWeight.w400,
         fontSize: ScreenUtil().setSp(24)
       ),)
      ],
    );
  }

  //Common widget build for making categories
  Widget buildCategoryItems(String imagePath,String label)
  {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imagePath,
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(100),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(15),),
          Container(
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setWidth(130),
              child: Text(label,textAlign: TextAlign.center,)
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    //ScreenUtil package
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Go Swak',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: ScreenUtil().setSp(45),
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    IconButton(icon: Icon(Icons.help_outline,size: 35,color: Colors.grey[400],),
                        onPressed: () {})
                  ],
                ),
              SizedBox(height: ScreenUtil().setHeight(20),),
              Container(
                height: ScreenUtil().setHeight(200),
                width: double.infinity,
                 child: Image.asset('assets/images/girlImage.jpg',fit: BoxFit.fill,),
              ),
                SizedBox(height: ScreenUtil().setHeight(25),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildFeature(featureText1, Icons.assignment_turned_in),
                  buildFeature(featureText2, Icons.assignment),
                  buildFeature(featureText3, Icons.directions_car)
                ],
              ),
                SizedBox(height: ScreenUtil().setHeight(25),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCategoryItems(categoryImagePath1, categoryLabel1),
                  buildCategoryItems(categoryImagePath2, categoryLabel2),
                  buildCategoryItems(categoryImagePath3, categoryLabel3),
                  buildCategoryItems(categoryImagePath4, categoryLabel4),
                  buildCategoryItems(categoryImagePath5, categoryLabel5),
                ],
              ),
                SizedBox(height: ScreenUtil().setHeight(15),),
              Container(
                height: ScreenUtil().setHeight(150),
                width: double.infinity,
                child: Image.asset('assets/images/random.jpg',fit: BoxFit.fitHeight,),
              ),
                SizedBox(height: ScreenUtil().setHeight(15),),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: CouponData().coupons.length,
                    itemBuilder: (ctx,index)
                {
                  return CouponItem(
                      label: CouponData().coupons[index].label,
                      imagePath: CouponData().coupons[index].imagePath,
                      sendUnits: CouponData().coupons[index].sendUnits,
                      amount: CouponData().coupons[index].amount,
                      soldUnits: CouponData().coupons[index].soldUnits,
                      soldUnitsUserImages: CouponData().coupons[index].soldUnitsUserImages
                  );
                }
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigation()
      ),
    );
  }
}
