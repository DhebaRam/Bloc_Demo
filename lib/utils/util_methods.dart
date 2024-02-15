
class UtilMethods {
  static final UtilMethods utilSharedInstanace = UtilMethods._internal();
  factory UtilMethods() => utilSharedInstanace;
  UtilMethods._internal();

  String capitalize(String val) =>
      "${val[0]}${val.substring(1).toLowerCase()}";




  // Future<LocationDataModel?> location(context) async {
  //   LocationPermission locationPermission;
  //   LocationDataModel? _location;
  //   locationPermission = await Geolocator.checkPermission();
  //   if (locationPermission == LocationPermission.denied) {
  //     locationPermission = await Geolocator.requestPermission();
  //     if (locationPermission == LocationPermission.denied) {
  //       myCustomToast("Location Permission Denied",context);
  //       return null;
  //     }
  //   }
  //   final position = await Geolocator.getCurrentPosition();
  //   final cord =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   final place = cord[0];
  //   String address = "";
  //   if(place.street!.isNotEmpty)
  //     {
  //       print("place.street.toString()");
  //       print(place.street.toString());
  //       address="${place.street.toString()}, ";
  //     }
  //   if(place.subLocality!.isNotEmpty)
  //   {
  //     print("place.subLocality.toString()");
  //     print(place.subLocality.toString());
  //     address=address+place.subLocality.toString()+", ";
  //   }
  //   if(place.postalCode!.isNotEmpty)
  //   {
  //     print("place.postalCode.toString()");
  //     print(place.postalCode.toString());
  //     address=address+place.postalCode.toString();
  //   }
  //
  //   _location = LocationDataModel(
  //     address: address,
  //     lat: position.latitude,
  //     city: "${place.locality}",
  //     long: position.longitude,
  //   );
  //   return _location;
  // }

  // Future<bool> microphone(context) async {
  //   PermissionStatus _microPhonePermission;
  //   _microPhonePermission = await Permission.microphone.status;
  //   if (_microPhonePermission == PermissionStatus.denied ||
  //       _microPhonePermission == PermissionStatus.permanentlyDenied) {
  //     _microPhonePermission = await Permission.microphone.request();
  //     if (_microPhonePermission == PermissionStatus.denied ||
  //         _microPhonePermission == PermissionStatus.permanentlyDenied) {
  //       _microPhonePermission = await Permission.microphone.request();
  //       return false;
  //     }
  //   }
  //   return true;
  // }


  // Future<bool> location(context) async {
  //   PermissionStatus _storagePermission;
  //   _storagePermission = await Permission.location.status;
  //   if (_storagePermission == PermissionStatus.denied ||
  //       _storagePermission == PermissionStatus.permanentlyDenied) {
  //     _storagePermission = await Permission.location.request();
  //     if (_storagePermission == PermissionStatus.denied ||
  //         _storagePermission == PermissionStatus.permanentlyDenied) {
  //       // myCustomErrorToast("Location Permission Denied",context);
  //       return false;
  //     }
  //   }
  //   return true;
  // }
  //
  // Future<bool> storagePermission(context) async {
  //   await Permission.storage.request();
  //   PermissionStatus _storagePermission;
  //   _storagePermission = await Permission.storage.status;
  //   if (_storagePermission == PermissionStatus.denied ||
  //       _storagePermission == PermissionStatus.permanentlyDenied) {
  //     _storagePermission = await Permission.storage.request();
  //     if (_storagePermission == PermissionStatus.denied ||
  //         _storagePermission == PermissionStatus.permanentlyDenied) {
  //       myCustomToast("Storage Permission Denied",context);
  //       return false;
  //     }
  //   }
  //   return true;
  // }
}

class LocationDataModel {
  String address, city;
  double lat, long;

  LocationDataModel({
    required this.address,
    required this.lat,
    required this.city,
    required this.long,
  });
}
