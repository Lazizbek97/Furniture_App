import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class PromoCodeEntry extends StatelessWidget {
  const PromoCodeEntry({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(44),
      width: getWidth(335),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Enter your promo code",
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              height: getHeight(44),
              width: getHeight(44),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
