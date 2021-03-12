import 'package:flutter/material.dart';
import 'package:munch_app/components/vertical_list_view_component.dart';

class CategoryList extends StatefulWidget {
  @override
  RrestaurantStatesList createState() => RrestaurantStatesList();
}

class RrestaurantStatesList extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return VerticalListView();
  }
}
