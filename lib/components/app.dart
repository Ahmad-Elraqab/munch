import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/custom_app_bar.dart';
import 'package:munch_app/providers/user_provider.dart';
import 'package:munch_app/screens/about_us_screen.dart';
import 'package:munch_app/screens/category_screen.dart';
import 'package:munch_app/screens/check_out_screen.dart';
import 'package:munch_app/screens/contact_us_screen.dart';
import 'package:munch_app/screens/item_view_screen.dart';
import 'package:munch_app/screens/cart_screen.dart';
import 'package:munch_app/screens/items_screen.dart';
import 'package:munch_app/screens/login_screen.dart';
import 'package:munch_app/screens/map_location.dart';
import 'package:munch_app/screens/munch_bunch_screen.dart';
import 'package:munch_app/screens/orders_history_screen.dart';
import 'package:munch_app/screens/profile_screen.dart';
import 'package:munch_app/screens/returning_user_screen.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/screens/main_screen.dart';
import 'package:munch_app/screens/orders_screen.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/screens/main_screen_when.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:provider/provider.dart';
import '../constants/routes.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  String currentIndex;
  App({this.currentIndex = mLandingScreen});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // ignore: unused_element
  _onItemTapped(index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  // ignore: missing_return
  Widget callPage(index) {
    switch (index) {
      case mLandingScreen:
        return ReturningUser();
        break;
      case "0":
        return CategoryList();
        break;
      case "1":
        return OrderScreen();
        break;
      case "2":
        return MunchBunch();
        break;
      case "3":
        _scaffoldKey.currentState.openDrawer();
        break;
      case mUserReturn:
        return ReturningUser();
        break;
      case mMainScreenWhen:
        return MainScreenWhen();
        break;
      case mMainScreen:
        return MainScreen();
        break;
      case mLoginScreen:
        return Login();
        break;
      case mMaps:
        return MapLocation();
        break;
      case mCategory:
        return CategoryList();
        break;
      case mItemScreen:
        return ItemScreen();
        break;
      case mItemViewScreen:
        return ItemViewScreen();
        break;
      case mCartScreen:
        return CartScreen();
        break;
      case mProfileScreen:
        return Profile();
        break;
      case mContactUs:
        return ContactUs();
        break;
      case mAboutUs:
        return AboutUs();
        break;
      case mOrdersHistory:
        return OrderHistory();
        break;
      case mCheckout:
        return Checkout();
        break;
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final dataService = service<DataService>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: Container(child: callPage(widget.currentIndex)),
                  ),
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
    Provider.of<UiProvider>(context).context = context;
    return Drawer(
      child: Container(
        // height: MediaQuery.of(context).size.height,
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
              title: GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(mProfileScreen),
                child: TextComponent(
                    title: getTranslated(context, "DrawerMyAccount"),
                    fontSize: 14,
                    textColor: "000000"),
              ),
            ),
            ListTile(
              title: TextComponent(
                  title: getTranslated(context, "DrawerMyAddresses"),
                  fontSize: 14,
                  textColor: "000000"),
            ),
            ListTile(
              title: TextComponent(
                  title: getTranslated(context, "DrawerStoreLocation"),
                  fontSize: 14,
                  textColor: "000000"),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(mAboutUs),
                child: TextComponent(
                    title: getTranslated(context, "DrawerAboutUs"),
                    fontSize: 14,
                    textColor: "000000"),
              ),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(mContactUs),
                child: TextComponent(
                    title: getTranslated(context, "DrawerContactUs"),
                    fontSize: 14,
                    textColor: "000000"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  Provider.of<UiProvider>(context).changeState();
                  // Navigator.pushReplacementNamed(context, mLoginScreen);
                },
                child: Provider.of<UiProvider>(context).loggedIn == true
                    ? ListTile(
                        title: TextComponent(
                            title: getTranslated(context, "DrawerLogout"),
                            fontSize: 14,
                            textColor: "000000"),
                      )
                    : ListTile(
                        title: TextComponent(
                            title: getTranslated(context, "DrawerLogin"),
                            fontSize: 14,
                            textColor: "000000"),
                      )),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<UiProvider>(context).changeLanguage();
                    },
                    child: RaisedButtonCom(
                      borderColor: "000000",
                      borderWidth: 2,
                      color: "FFFFFF",
                      fontSize: 14,
                      padding: 10,
                      radius: 10,
                      textColor: "000000",
                      title: getTranslated(context, "DrawerChangeLanguage"),
                    ),
                  ),
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
            ),
            title: getTranslated(context, 'bottomNavigationBarProductsButton'),
          ),
          _getNavItem(
            index: '1',
            iconActive: SvgPicture.asset(
              'lib/assets/Nav-Orders_Active.svg',
              color: HexColor('F26882'),
            ),
            iconInactive: SvgPicture.asset(
              'lib/assets/Nav-Orders_Inactive.svg',
              color: HexColor('C7C7C7'),
            ),
            title: getTranslated(context, 'bottomNavigationBarOrdersButton'),
          ),
          _getNavItem(
            index: '2',
            iconActive: SvgPicture.asset(
              'lib/assets/Nav-MunchBunch_Active.svg',
              color: HexColor('F26882'),
            ),
            iconInactive: SvgPicture.asset(
              'lib/assets/Nav-MunchBunch_Inactive.svg',
              color: HexColor('C7C7C7'),
            ),
            title:
                getTranslated(context, 'bottomNavigationBarMunchBunchButton'),
          ),
          _getNavItem(
            index: '3',
            iconActive: SvgPicture.asset(
              'lib/assets/Nav-More_Active.svg',
              color: HexColor('F26882'),
            ),
            iconInactive: SvgPicture.asset(
              'lib/assets/Nav-More_Inactive.svg',
              color: HexColor('C7C7C7'),
            ),
            title: getTranslated(context, 'bottomNavigationBarMenuButton'),
          ),
        ],
      ),
    );
  }

  Widget _getNavItem({
    String index,
    SvgPicture iconActive,
    SvgPicture iconInactive,
    String title,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.currentIndex = index.toString();
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              child: widget.currentIndex == index ? iconActive : iconInactive),
          TextComponent(
            fontSize: 12,
            title: title,
            textColor: widget.currentIndex == index ? 'F26882' : 'C7C7C7',
          )
        ],
      ),
    );
  }
}

Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.white),
            ),
          ),
          child: TextComponent(
            fontSize: 14,
            textColor: "FFFFFF",
            title: getTranslated(context, "chooseCity"),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Login(),
        backgroundColor: HexColor("F26882"),
        actions: [],
      );
    },
  );
}
