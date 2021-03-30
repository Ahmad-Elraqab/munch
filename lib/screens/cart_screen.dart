import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/providers/future_provider.dart';
import 'package:munch_app/providers/user_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: TextComponent(
                        fontSize: 14,
                        textColor: "000000",
                        title: "Cart",
                        weight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: TextComponent(
                        fontSize: 14,
                        textColor: "000000",
                        title: "Price",
                        weight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: TextComponent(
                        fontSize: 14,
                        textColor: "000000",
                        title: "Quantity",
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.all(0.0),
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: NetworkImage(
                                "https://hsaa.hsobjects.com/h/menuitems/images/001/765/500/7dc3fb6c364fa160d3d32ec89194266b-size900.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: TextComponent(
                          fontSize: 14,
                          textColor: "000000",
                          title: "Red vlet cake",
                          weight: FontWeight.w600,
                          align: TextAlign.start,
                        ),
                        trailing: Container(
                          width: 110,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                  onPressed: null),
                              TextComponent(
                                fontSize: 14,
                                textColor: "000000",
                                title: "1",
                                weight: FontWeight.w700,
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                  onPressed: null),
                            ],
                          ),
                        ),
                        subtitle: Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RaisedButtonCom(
                                borderColor: "FFFFFF",
                                color: "FFFFFF",
                                borderWidth: 0,
                                height: 20,
                                fontSize: 14,
                                padding: 0,
                                textAlign: null,
                                radius: 0,
                                textColor: "F26882",
                                title: "delete",
                              ),
                              TextComponent(
                                title: "290 (SAR)",
                                fontSize: 14,
                                textColor: "F26882",
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
                child: TextComponent(
                  fontSize: 14,
                  textColor: "000000",
                  title: "You might like this",
                  weight: FontWeight.w700,
                  align: TextAlign.center,
                ),
              ),
              Container(
                height: 250,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.78,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    padding: EdgeInsets.all(0.0),
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      10,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            child: Consumer(
                              builder: (context, watch, child) {
                                final data = watch(responseProvider);
                                // final dataImg = watch(
                                //   imageProvider(data.data.value[index].picture.picturePath),
                                // );
                                // print(data.data.value);
                                return data.map(
                                  error: (_) => Text("Error"),
                                  loading: (_) => CircularProgressIndicator(),
                                  data: (value) => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // image: DecorationImage(
                                          // image: NetworkImage(dataImg.toString()),
                                          // fit: BoxFit.contain,
                                          // ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: TextComponent(
                                          fontSize: 14,
                                          textColor: "000000",
                                          title: value.value[index].catName,
                                        ),
                                        height: 30,
                                      ),
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.pushNamed(
                                              context, mItemViewScreen)
                                        },
                                        child: RaisedButtonCom(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: 35,
                                          borderColor: "000000",
                                          color: "FFFFFF",
                                          fontSize: 14,
                                          borderWidth: 2,
                                          padding: 2,
                                          radius: 12,
                                          textAlign: null,
                                          textColor: "000000",
                                          title: getTranslated(
                                              context, "mainPageByNowButton"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextComponent(
                      textColor: "000000",
                      fontSize: 14,
                      title: "Subtotal (2 items): ",
                      weight: FontWeight.w700,
                    ),
                    TextComponent(
                      textColor: "F26882",
                      fontSize: 14,
                      title: "499.00 SAR",
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(mCheckout),
                    child: RaisedButtonCom(
                      borderColor: "F26882",
                      color: "F26882",
                      fontSize: 14,
                      borderWidth: 0,
                      radius: 15,
                      padding: 16,
                      textAlign: null,
                      textColor: "FFFFFF",
                      title: "Procced to checkout",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
