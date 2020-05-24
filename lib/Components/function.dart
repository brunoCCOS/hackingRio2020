import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


double getRadiansDegree (double degree){
  double unitRadian =57.295779513;
  return degree/unitRadian;
}

getPosition() async {
  try{
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position.latitude);
    print(position.longitude);
    return position;
  }
  catch(e){
    print(e);
  }
}

getCameraPosition() async {
    Position location =  await getPosition();
    return CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(location.latitude, location.longitude),
        zoom: 19.151926040649414);
}