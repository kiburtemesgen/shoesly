import 'package:flutter/material.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/common_appbar.dart';
import 'package:prior_soft/core/widgets/common_fab.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: commonFAB('CHECKOUT', 705.00, context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: commonAppBar(
          title: 'Cart',
          leading: const Icon(Icons.arrow_back_sharp),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            _cartItem(1, false),
            _cartItem(2, false),
            _cartItem(3, true),
          ],
        )));
  }

  Widget _cartItem(int index, bool isDeleting) {
    double hPadding = isDeleting ? 0 : kPadding;
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 0.5,
      child: GestureDetector(
        onHorizontalDragStart: (val) {
          print('drag started');
        },
        onHorizontalDragCancel: () {
          print('cancel');
        },
        // onHorizontalDragUpdate: (val){
        //   print('on update');
        // },
        onForcePressStart: (update) {},
        onHorizontalDragEnd: (details) {
          print('end');
          if (details.velocity.pixelsPerSecond.dx < 0) {}
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(hPadding, 0, hPadding, 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.centerRight,
                  widthFactor: isDeleting ? 0.5 : 1,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/wohf5k8sjdmgogckoczk/air-jordan-1-mid-shoes-D8g1Qq.png'))),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                    customText(
                        text: 'Jordan 1 Retro High Tie Dye',
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    customText(
                        text: 'Nike Red Grey 40',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(text: '\$235.00'),
                        Row(
                          children: [
                            const Icon(
                              Icons.remove_circle_outline,
                              size: 25,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            customText(text: '1', fontWeight: FontWeight.bold),
                            const SizedBox(
                              width: 7,
                            ),
                            const Icon(
                              Icons.add_circle_outline,
                              size: 25,
                            )
                          ],
                        )
                      ],
                    )
                                  ],
                                ),
                  )),
              !isDeleting
                  ? const SizedBox()
                  : Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            color: Colors.redAccent,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
