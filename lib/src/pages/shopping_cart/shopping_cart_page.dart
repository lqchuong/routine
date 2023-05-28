import 'package:flutter/material.dart';
import 'package:routine_app/src/model/data.dart';
import 'package:routine_app/src/model/product.dart';
import 'package:routine_app/src/pages/slide_bar/sidebar_menu.dart';
import 'package:routine_app/src/themes/light_color.dart';
import 'package:routine_app/src/themes/theme.dart';
import 'package:routine_app/src/widgets/title_text.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  Widget _cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: LightColor.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: -20,
                  bottom: -20,
                  child: Image.asset(model.image ?? ''),
                )
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: model.name ?? '',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: '\$ ',
                        color: LightColor.skyBlue,
                        fontSize: 12,
                      ),
                      TitleText(
                        text: model.price.toString(),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: LightColor.lightGrey.withAlpha(150),
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: 'x${model.id}',
                      fontSize: 12,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: '${AppData.cartList.length} Items',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: '\$${getPrice()}',
          fontSize: 18,
        ),
      ],
    );
  }

  Widget _appBar() {
    return Container(
      height: 50,
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // InkWell(
          //   onTap: () {
          //     SlideBarMenuView();
          //   },
          //   child: RotatedBox(
          //     quarterTurns: 4,
          //     child: _icon(Icons.sort, color: Colors.black54),
          //   ),
          // ),
          // ClipRRect(
          //   borderRadius: BorderRadius.all(Radius.circular(13)),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).backgroundColor,
          //       boxShadow: <BoxShadow>[
          //         BoxShadow(
          //             color: Color(0xfff8f8f8),
          //             blurRadius: 10,
          //             spreadRadius: 10),
          //       ],
          //     ),
          //     child: Image.asset("assets/user.png"),
          //   ),
          // ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(LightColor.skyBlue),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 4),
        width: AppTheme.fullWidth(context) * .75,
        child: TitleText(
          text: 'Next',
          color: LightColor.background,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  double getPrice() {
    // double price = 0;
    // AppData.cartList.forEach((x) {
    //   price += x.price * x.id;
    // });
    return 20.00;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: SlideBarMenuView(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _appBar(),
            _cartItems(),
            Divider(
              thickness: 1,
              height: 70,
            ),
            _price(),
            SizedBox(height: 30),
            _submitButton(context),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
