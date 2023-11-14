import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PositionProcess {
  static Future<Map<String, double>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    final Map<String, double> result = {
      'latitude': position.latitude,
      'longitude': position.longitude
    };
    return result;

// return Map<
//     return await Geolocator.getCurrentPosition();
  }

  static Future<void> savePosition(Map<String, double> position) async {
    final prefs = await SharedPreferences.getInstance();
    // String positionString = jsonEncode({
    //   'latitude': position.latitude,
    //   'longitude': position.longitude,
    //   'timestamp': position.timestamp,
    //   'accuracy': position.accuracy,
    //   'altitude': position.altitude,
    //   'altitudeAccuracy': position.altitudeAccuracy,
    //   'heading': position.heading,
    //   'headingAccuracy': position.headingAccuracy,
    //   'speed': position.speed,
    //   'speedAccuracy': position.speedAccuracy,
    //   // 다른 필요한 필드 추가
    // });
    final double latitude = position['latitude'] as double;
    final double longitude = position['longitude'] as double;
    await prefs.setDouble('latitude', latitude);
    await prefs.setDouble('longitude', longitude);
    // await prefs.setString('userPosition', positionString);
  }

  static Future<Map<String, double>> getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    double? latitude = prefs.getDouble('latitude');
    double? longitude = prefs.getDouble('longitude');

    if (latitude != null && longitude != null) {
      // Map<String, dynamic> positionMap = jsonDecode(positionString);
      // final a = Position.fromMap(positionMap);
      // return Position(
      //   longitude: positionMap['longitude'],
      //   latitude: positionMap['latitude'],
      //   timestamp: positionMap['timestamp'],
      //   accuracy: positionMap['accuracy'],
      //   altitude: positionMap['altitude'],
      //   altitudeAccuracy: positionMap['altitudeAccuracy'],
      //   heading: positionMap['heading'],
      //   headingAccuracy: positionMap['headingAccuracy'],
      //   speed: positionMap['spped'],
      //   speedAccuracy: positionMap['speedAccuracy'],
      // );
      final Map<String, double> result = {
        'latitude': latitude,
        'longitude': longitude
      };
      return result;
    } else {
      return Future.error(Exception('위치정보 없음'));
    }
  }

  static Future<void> removeLocation() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('latitude');
    await prefs.remove('longitude');
  }
}
