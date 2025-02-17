import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/screens/category/category_viewmodel.dart';
import 'package:munch_app/screens/view.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      child: View(
        viewmodel: CategoryViewmodel(),
        builder: (_, viewmodel, __) {
          // final dataImg = watch(
          //   imageProvider(data.data.value[index].picture.picturePath),
          // );
          // print(data.data.value);
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            padding: EdgeInsets.all(0.0),
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              5,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // image: DecorationImage(
                            //   // image: NetworkImage(
                            //   //   // data.data.value[index].picture.picturePath
                            //   //       // .toString(),
                            //   // ),
                            //   fit: BoxFit.contain,
                            //   // ),
                            // ),
                          ),
                        ),
                        SizedBox(
                          child: TextComponent(
                            fontSize: 14,
                            textColor: "000000",
                            title: "Munch",
                          ),
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () =>
                              {Navigator.pushNamed(context, mItemScreen)},
                          child: RaisedButtonCom(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 35,
                            borderColor: "000000",
                            color: "FFFFFF",
                            fontSize: 14,
                            borderWidth: 2,
                            padding: 2,
                            radius: 12,
                            textAlign: null,
                            textColor: "000000",
                            title:
                                getTranslated(context, "mainPageByNowButton"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
