import 'package:flutter/material.dart';

class AppContainerWidhthWidget extends StatelessWidget {
  final Widget child;

  const AppContainerWidhthWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth > 1000 ? 1000 : constraints.maxWidth;
        return Center(
          child: SizedBox(
            width: width,
            child: child,
          ),
        );
      },
    );
  }
}
