import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:munch_app/components/raised_button_component.dart';

class Addresses extends StatefulWidget {
  @override
  AddressesState createState() => AddressesState();
}

class AddressesState extends State<Addresses>
    with SingleTickerProviderStateMixin {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  LatLng pinPosition = LatLng(21.407104, 39.776688);
  Location _location = Location();
  GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    // _onMapCreated(_controller);
    _markers.add(
      Marker(
          markerId: MarkerId('<MARKER_ID>'),
          position: pinPosition,
          icon: pinLocationIcon),
    );
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 1),
        'lib/assets/maps-and-flags.png');
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen(
      (l) {
        CameraUpdate.newCameraPosition(
          CameraPosition(target: pinPosition, zoom: 15),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation =
        CameraPosition(zoom: 16, bearing: 30, target: pinPosition);

    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      width: MediaQuery.of(context).size.width,
      color: Colors.amberAccent,
      child: Scaffold(
        body: GoogleMap(
          myLocationEnabled: false,
          compassEnabled: false,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          markers: _markers,
          initialCameraPosition: initialLocation,
          onMapCreated: _onMapCreated,
          // onCameraMove: setMarker,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: Container(
          padding: EdgeInsets.only(top: 16.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: GestureDetector(
            // onTap: () => Navigator.pushReplacementNamed(context, mCategory),
            child: RaisedButtonCom(
              title: "Add new address",
              color: "F26882",
              fontSize: 14,
              textAlign: TextAlign.center,
              padding: 10,
              radius: 10,
              textColor: "FFFFFF",
              borderColor: "F26882",
              borderWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
