import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/custom_app_bar.dart';
import 'package:munch_app/providers/ui_provider/ui_action.dart';
import 'package:munch_app/providers/user_provider/user_action.dart';
import 'package:munch_app/screens/about_us/about_us_screen.dart';
import 'package:munch_app/screens/address/address_screen.dart';
import 'package:munch_app/screens/category/category_screen.dart';
import 'package:munch_app/screens/checkout/check_out_screen.dart';
import 'package:munch_app/screens/contact_us/contact_us_screen.dart';
import 'package:munch_app/screens/item/item_view_screen.dart';
import 'package:munch_app/screens/cart/cart_screen.dart';
import 'package:munch_app/screens/items/items_screen.dart';
import 'package:munch_app/screens/login/login_screen.dart';
import 'package:munch_app/screens/map_location/map_location.dart';
import 'package:munch_app/screens/munch_bunch/munch_bunch_screen.dart';
import 'package:munch_app/screens/orders_history/orders_history_screen.dart';
import 'package:munch_app/screens/profile/profile_screen.dart';
import 'package:munch_app/screens/registration/registeration_screen.dart';
import 'package:munch_app/screens/returning_user/returning_user_screen.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/screens/main/main_screen.dart';
import 'package:munch_app/screens/orders/orders_screen.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/screens/main_when/main_screen_when.dart';
import 'package:munch_app/constants/routes.dart';
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
        return MainScreen();
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
      case mAddresses:
        return Addresses();
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
    // Provider.of<UiProvider>(context).context = context;
    return Drawer(
      child: Consumer(
        builder: (context, watch, child) => Container(
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
                  onTap: () async {
                    await watch(setLoading).getSharedPrefrence() == true
                        ? Navigator.of(context)
                            .pushReplacementNamed(mProfileScreen)
                        : buildShowDialogLogin(context);
                  },
                  child: TextComponent(
                      title: getTranslated(context, "DrawerMyAccount"),
                      fontSize: 14,
                      textColor: "000000"),
                ),
              ),
              ListTile(
                title: GestureDetector(
                  onTap: () async {
                    await watch(setLoading).getSharedPrefrence() == true
                        ? Navigator.of(context).pushReplacementNamed(mAddresses)
                        : buildShowDialogLogin(context);
                  },
                  child: TextComponent(
                      title: getTranslated(context, "DrawerMyAddresses"),
                      fontSize: 14,
                      textColor: "000000"),
                ),
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
              Consumer(builder: (context, watch, child) {
                return GestureDetector(
                  onTap: () async {
                    await watch(setLoading).getSharedPrefrence() == true
                        ? watch(setLoading).logout()
                        : buildShowDialogLogin(context);
                  },
                  child: ListTile(
                    title: TextComponent(
                        title: watch(setLoading).getSharedPrefrence() == true
                            ? getTranslated(context, "DrawerLogout")
                            : getTranslated(context, "DrawerLogin"),
                        fontSize: 14,
                        textColor: "000000"),
                  ),
                );
              }),
              Consumer(
                builder: (context, watch, child) => Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          watch(uiProvider).changeLanguage(context);
                        },
                        child: RaisedButtonCom(
                          borderColor: "000000",
                          borderWidth: 2,
                          color: "FFFFFF",
                          fontSize: 14,
                          padding: 10,
                          radius: 10,
                          textAlign: null,
                          textColor: "000000",
                          title: getTranslated(context, "DrawerChangeLanguage"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
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
    return Consumer(
      builder: (context, watch, child) => InkWell(
        onTap: () async {
          await watch(setLoading).getSharedPrefrence() == true ||
                  index == "0" ||
                  index == "3"
              ? setState(() {
                  widget.currentIndex = index.toString();
                })
              : buildShowDialogLogin(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child:
                    widget.currentIndex == index ? iconActive : iconInactive),
            TextComponent(
              fontSize: 12,
              title: title,
              textColor: widget.currentIndex == index ? 'F26882' : 'C7C7C7',
            )
          ],
        ),
      ),
    );
  }
}

Future buildShowDialogLogin(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      bool login = true;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        insetPadding: EdgeInsets.all(0.0),
        titlePadding: EdgeInsets.all(0.0),
        buttonPadding: EdgeInsets.all(0.0),
        actionsPadding: EdgeInsets.all(0.0),
        contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
        content: StatefulBuilder(
          builder: (context, setState) => SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            setState(
                              () => login = true,
                            )
                          },
                          child: login
                              ? RaisedButtonCom(
                                  title: getTranslated(context, "login"),
                                  color: "66CDAA",
                                  textAlign: null,
                                  fontSize: 12,
                                  padding: 12,
                                  radius: 10,
                                  textColor: "FFFFFF",
                                  borderColor: "66CDAA",
                                  borderWidth: 2,
                                )
                              : RaisedButtonCom(
                                  title: getTranslated(context, "login"),
                                  color: "FFFFFF",
                                  fontSize: 12,
                                  padding: 12,
                                  textAlign: null,
                                  radius: 10,
                                  textColor: "000000",
                                  borderColor: "000000",
                                  borderWidth: 2,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            setState(
                              () => login = false,
                            )
                          },
                          child: !login
                              ? RaisedButtonCom(
                                  title: getTranslated(context, "newUser"),
                                  color: "66CDAA",
                                  fontSize: 12,
                                  padding: 12,
                                  textAlign: null,
                                  radius: 10,
                                  textColor: "FFFFFF",
                                  borderColor: "66CDAA",
                                  borderWidth: 2,
                                )
                              : RaisedButtonCom(
                                  title: getTranslated(context, "newUser"),
                                  color: "FFFFFF",
                                  fontSize: 12,
                                  padding: 12,
                                  textAlign: null,
                                  radius: 10,
                                  textColor: "000000",
                                  borderColor: "000000",
                                  borderWidth: 2,
                                ),
                        ),
                      ),
                    ],
                  ),
                  login ? Login() : SignUp(),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [],
      );
    },
  ).then((value) => context.read(setLoading).clearBoard());
}
