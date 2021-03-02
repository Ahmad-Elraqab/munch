import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  double height = 70;
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: widget.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'lib/assets/Icon_Gift.svg',
                  fit: BoxFit.cover,
                ),
                onPressed: () => {},
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pink[400],
                    maxRadius: 12,
                    child: Text(
                      "0",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'lib/assets/Icon_Cart.svg',
                      fit: BoxFit.cover,
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 40,
          top: widget.height - 40,
          child: CircleAvatar(
            maxRadius: 40,
            backgroundImage: NetworkImage(
                'https://b2b.munchbakery.com/wp-content/uploads/2018/12/logo-munch.png'),
          ),

          // child:
          // SvgPicture.asset(
          //   'lib/assets/main_logo.svg',
          // ),
        ),
      ],
    );
  }
}
