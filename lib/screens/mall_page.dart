import 'package:flutter/material.dart';
import 'package:fluttergoshak/widgets/bottom_navgation.dart';
class MallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
