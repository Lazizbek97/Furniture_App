import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/size_config.dart';

class CanceledCards extends StatelessWidget {
  const CanceledCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return Container(
          height: getHeight(172),
          width: getWidth(335),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 25.0)
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order No238562312",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: Constants.semiBold,
                          ),
                        ),
                        Text(
                          "20/03/2020",
                          style: TextStyle(
                            color: Constants.color90,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xffF0F0F0),
                    thickness: 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Quntity:  ",
                            ),
                            Text(
                              (Random().nextInt(10)+1).toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: Constants.semiBold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Total Amount:  "),
                            Text(
                              "\$ ${(Random().nextInt(10)+45)}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: Constants.semiBold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: getHeight(20),
                left: 0,
                child: SizedBox(
                  height: getHeight(36),
                  width: getWidth(100),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Details"),
                  ),
                ),
              ),
              Positioned(
                bottom: getHeight(20),
                right: getWidth(15),
                child:  Text(
                  "Canceled",
                  style: TextStyle(color: Constants.color90, fontSize: 16.0),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
