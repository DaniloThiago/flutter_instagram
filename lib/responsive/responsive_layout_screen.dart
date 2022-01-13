import 'package:flutter/material.dart';
import 'package:instagram/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScrennLayout;
  final Widget mobileScrennLayout;
  const ResponsiveLayout({ 
    Key? key,
    required this.webScrennLayout,
    required this.mobileScrennLayout
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > webScreenSize) {
          return webScrennLayout;
        }
        return mobileScrennLayout;
      }
    );
  }
}