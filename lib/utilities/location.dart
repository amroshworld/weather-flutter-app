import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future currentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print(position);

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
