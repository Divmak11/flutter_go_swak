import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttergoshak/constants.dart';
import 'package:fluttergoshak/model/data_class.dart';
import 'package:fluttergoshak/model/dummy_data.dart';
import 'package:fluttergoshak/widgets/custom_bottom_bar.dart';
class ProductDetails extends StatelessWidget {
  
  final String id;
  ProductDetails(this.id);


  Widget buildFeaturesRow(IconData iconData,String label)
  {
    return Row(
      children: [
        Icon(
          iconData,
          size: ScreenUtil().setHeight(32),
          color: Colors.pinkAccent,
        ),
        SizedBox(width: ScreenUtil().setWidth(20),),
        Text(
          label,
          style: TextStyle(
            color: Colors.pinkAccent,
            fontSize: ScreenUtil().setSp(30),
          ),
        ),
      ],
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    Product product = ProductData().products.firstWhere((element) => element.id == id);
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(20),),
                Stack(
                  children: [
                    Container(
                      height: ScreenUtil.screenHeight/2,
                      width: ScreenUtil.screenWidth,
                      child: Image.asset(product.imagePath,fit: BoxFit.contain,),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(30),
                        top: ScreenUtil().setHeight(30),
                        child: Container(
                          height: ScreenUtil().setHeight(100),
                          width: ScreenUtil().setHeight(100),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(ScreenUtil().setHeight(80))
                          ),
                          child: IconButton(
                              icon: Icon(Icons.arrow_back,color: Colors.white,),
                              onPressed: ()=> Navigator.of(context).pop()
                          ),
                        )),
                    Positioned(
                        right: ScreenUtil().setWidth(30),
                        top: ScreenUtil().setHeight(30),
                        child: Container(
                          height: ScreenUtil().setHeight(100),
                          width: ScreenUtil().setHeight(100),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(ScreenUtil().setHeight(80))
                          ),
                          child: IconButton(
                              icon: Icon(Icons.share,color: Colors.white,),
                              onPressed: null
                          ),
                        ))
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(
                          'P${product.amount}',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(45),
                          ),
                         ),
                          Text(
                            '${product.soldUnits} sold',
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: ScreenUtil().setSp(28),
                                fontWeight: FontWeight.w400),
                          ),
                        ],),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        Text(
                          'Invite 2 people',
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: ScreenUtil().setSp(24),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        Text(
                          'Simple Camisole',
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenUtil().setSp(26),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10),),
                        Divider(height: 2,thickness: 2,),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Flexible(
                              flex: 14,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildFeaturesRow(Icons.check_circle, 'Quality Assurance'),
                                      buildFeaturesRow(Icons.tram, 'Free Shipping & COD'),
                                    ],),
                                  buildFeaturesRow(Icons.help_outline, '7-Day Return')
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                                child: IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null))
                          ]
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),
                        Divider(height: 2,thickness: 10,),
                        SizedBox(height: ScreenUtil().setHeight(20),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Join Group Buy',
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(35),
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'More',
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: ScreenUtil().setSp(32),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: ScreenUtil().setHeight(30),),
                        Divider(height: 2,thickness: 5,),
                        //Complex part
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomBar(),
        )
    );
  }
}
