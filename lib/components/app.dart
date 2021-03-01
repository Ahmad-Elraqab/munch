import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/custom_app_bar.dart';
import 'package:munch_app/screens/returning_user.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/screens/main_screen.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/screens/main_screen_when.dart';
import 'package:munch_app/constants/routes.dart';

class App extends StatefulWidget {
  String currentIndex;
  App({this.currentIndex = "/"});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _onItemTapped(index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  // ignore: missing_return
  Widget callPage(index) {
    switch (index) {
      case mUserReturn:
        return ReturningUser();
        break;
      case "0":
        return Container();
        break;
      case "1":
        return Container();
        break;
      case "2":
        return Container();
        break;
      case "3":
        return Container();
        break;
      case mLandingScreen:
        return ReturningUser();
        break;
      case mMainScreenWhen:
        return MainScreenWhen();
        break;
      case mMainScreen:
        return MainScreen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final dataService = service<DataService>();
    return SafeArea(
      child: Scaffold(
        drawer: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: buildDrawer(context)),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: callPage(widget.currentIndex)),
                ],
              ),
            ),
            CustomAppBar(),
          ],
        ),
        bottomNavigationBar: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: _getBottomNav()),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            DrawerHeader(
              child: Image(
                fit: BoxFit.contain,
                image: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1327575747553267713/eRd8dNQ5.jpg'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: TextComponent(
                  title: "My Account", fontSize: 18, textColor: "000000"),
            ),
            ListTile(
              title: TextComponent(
                  title: "My Addresses", fontSize: 18, textColor: "000000"),
            ),
            ListTile(
              title: TextComponent(
                  title: "Store Location", fontSize: 18, textColor: "000000"),
            ),
            ListTile(
              title: TextComponent(
                  title: "About Us", fontSize: 18, textColor: "000000"),
            ),
            ListTile(
              title: TextComponent(
                  title: "Contanct Us", fontSize: 18, textColor: "000000"),
            ),
            Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            ListTile(
              title: TextComponent(
                  title: "Logout", fontSize: 18, textColor: "000000"),
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                RaisedButtonCom(
                  borderColor: "000000",
                  borderWidth: 2,
                  color: "FFFFFF",
                  fontSize: 12,
                  padding: 0,
                  radius: 10,
                  textColor: "000000",
                  title: "Change to Arabic",
                  fontWieght: "bold",
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _getBottomNav() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _getNavItem(
              index: '0',
              iconActive: SvgPicture.asset(
                'lib/assets/Nav-Products_Active.svg',
                color: HexColor('F26882'),
              ),
              iconInactive: SvgPicture.asset(
                'lib/assets/Nav-Products_Inactive.svg',
                color: HexColor('C7C7C7'),
              )),
          _getNavItem(
              index: '1',
              iconActive: SvgPicture.asset(
                'lib/assets/Nav-Orders_Active.svg',
                color: HexColor('F26882'),
              ),
              iconInactive: SvgPicture.asset(
                'lib/assets/Nav-Orders_Inactive.svg',
                color: HexColor('C7C7C7'),
              )),
          _getNavItem(
              index: '2',
              iconActive: SvgPicture.asset(
                'lib/assets/Nav-MunchBunch_Active.svg',
                color: HexColor('F26882'),
              ),
              iconInactive: SvgPicture.asset(
                'lib/assets/Nav-MunchBunch_Inactive.svg',
                color: HexColor('C7C7C7'),
              )),
          _getNavItem(
              index: '3',
              iconActive: SvgPicture.asset(
                'lib/assets/Nav-More_Active.svg',
                color: HexColor('F26882'),
              ),
              iconInactive: SvgPicture.asset(
                'lib/assets/Nav-More_Inactive.svg',
                color: HexColor('C7C7C7'),
              )),
        ],
      ),
    );
  }

  Widget _getNavItem(
      {String index, SvgPicture iconActive, SvgPicture iconInactive}) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.currentIndex = index.toString();
        });
      },
      child: Container(
          child: widget.currentIndex == index ? iconActive : iconInactive),
    );
  }
}
