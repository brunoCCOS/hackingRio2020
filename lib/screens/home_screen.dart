import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import '../Components/function.dart';
import '../Components/TextBox.dart';
import '../Components/buttons.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> with TickerProviderStateMixin {
  Completer<GoogleMapController> _controller = Completer();
  AnimationController rotationController;
  AnimationController rotationController2;
  bool animation1 = true;
  bool animation2 = true;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    rotationController2 = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    rotationController.dispose();
    rotationController2.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextBox(),
          RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(rotationController),
              //mostra a barra de digitação
              child: LogoButton(
                action: () {
                  if (animation1) {
                    rotationController.forward();
                    animation1 = !animation1;
                  } else {
                    rotationController.animateBack(0);
                    animation1 = !animation1;
                  }
                  setState(() {
                    TextBox.selected = !TextBox.selected;
                  });
                },
              )),
        ]),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: AppBar(
            backgroundColor: Colors.black,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 71),
                  child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5)
                          .animate(rotationController2),
                      //ativa a disponibilidade para receber pedidos de entrega
                      child: IconButton(
                          icon: Delivery(),
                          onPressed: () {
                            if (animation2) {
                              rotationController2.forward();
                              animation2 = !animation2;
                            } else {
                              rotationController2.animateBack(0);
                              animation2 = !animation2;
                            }
                            setState(() {
                              Delivery.first = !Delivery.first;
                            });
                          }))),
              Padding(
                  padding: EdgeInsets.only(right: 70),
                  child: Image(
                    image: AssetImage('assets/logo_app.png'),
                  )),
              IconButton(
                  //aponta o mapa para a localização atual
                  icon: Icon(Icons.gps_fixed, color: Colors.white),
                  onPressed: _goToTheCurrentPosition)
            ],
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 550,
              child: GoogleMap(
                //gera o mapa
                trafficEnabled: true,
                buildingsEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  //easter egg
                  target: LatLng(-22.859831, -43.229839),
                  zoom: 20,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              )),

        ]));
  }

  Future<void> _goToTheCurrentPosition() async {
    GoogleMapController controller = await _controller.future;
    CameraPosition camera = await getCameraPosition();

    controller.animateCamera(CameraUpdate.newCameraPosition(camera));
  }
}
