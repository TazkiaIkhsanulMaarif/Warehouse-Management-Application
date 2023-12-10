import 'package:gudang/app_properties.dart';
import 'package:gudang/models/product.dart';
import 'package:gudang/screens/product/components/color_list.dart';
import 'package:gudang/screens/product/components/shop_product.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ShopItemList extends StatefulWidget {
  final Product product;
  final VoidCallback onRemove;

  ShopItemList(this.product, {required this.onRemove});

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 130,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 12.0, right: 5.0),
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.product.name,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: darkGrey,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 160,
                                padding: const EdgeInsets.only(
                                    left: 38.0, top: 8.0, bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ColorOption(Colors.red),
                                    Text(
                                      '\Rp  ${widget.product.price}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: darkGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Theme(
                          data: ThemeData(
                            textTheme: TextTheme(
                              headline6: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Colors.black, // Atur warna teks terpilih
                                fontWeight: FontWeight.bold,
                              ),
                              bodyText1: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                color: Colors.grey[
                                    400], // Atur warna teks yang tidak terpilih
                              ),
                            ),
                          ),
                          child: NumberPicker(
                            value: quantity,
                            minValue: 1,
                            maxValue: 10,
                            textStyle: TextStyle(
                                color: Colors
                                    .black), // Atur warna teks yang tidak terpilih
                            selectedTextStyle: TextStyle(
                              color: Colors.black, // Atur warna teks terpilih
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (value) {
                              setState(() {
                                quantity = value;
                              });
                            },
                          )),
                    ])),
          ),
          Positioned(
              top: 5,
              child: ShopProductDisplay(
                widget.product,
                onPressed: widget.onRemove,
              )),
        ],
      ),
    );
  }
}
