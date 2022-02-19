import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class ColorChekcer extends StatelessWidget {
   ColorChekcer({
    Key? key,
    required color,
    required child,
  })  : _color = color,
        _child = child,
        super(key: key);

  final Color _color;
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(34),
      width: getHeight(34),
      decoration: BoxDecoration(
        color: _color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: _child,
    );
  }
}
