import 'package:android_intent_plus/android_intent.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location{
  double longitude = 0, latitude = 0;

  Future<void> perms() async{
    if(await Permission.location.status.isGranted){
      return;
    }else{
      Map<Permission, PermissionStatus> status = await[Permission.location].request();
      return;
    }
  }

  Future<void> checkLocationOn() async {
    if(await Permission.location.serviceStatus.isEnabled){
      perms();
    }else{
      const AndroidIntent intent = AndroidIntent(
        action: 'android.settings.LOCATION_SOURCE_SETTINGS',
      );
      await intent.launch();
      perms();
    }
  }

  Future<Position> getLocation() async {
    checkLocationOn();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    longitude = position.longitude;
    latitude = position.latitude;
    return position;
  }
}