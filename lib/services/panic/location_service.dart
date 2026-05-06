import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationResult {
  const LocationResult({
    required this.success,
    required this.message,
    this.mapsUrl,
  });

  final bool success;
  final String message;
  final String? mapsUrl;
}

class LocationService {
  Future<LocationResult> getCurrentLocationLink() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const LocationResult(
          success: false,
          message: 'Location services are disabled on this device.',
        );
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        return const LocationResult(
          success: false,
          message: 'Location permission was denied.',
        );
      }

      if (permission == LocationPermission.deniedForever) {
        return const LocationResult(
          success: false,
          message:
              'Location permission is permanently denied. Enable it from settings.',
        );
      }

      Position? position;
      var locationSource = 'high-accuracy GPS';

      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 15),
        );
      } on TimeoutException {
        // Retry with balanced accuracy, then fallback to last known location.
        try {
          position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium,
            timeLimit: const Duration(seconds: 10),
          );
          locationSource = 'balanced GPS';
        } catch (_) {
          position = await Geolocator.getLastKnownPosition();
          locationSource = 'last known location';
        }
      }

      if (position == null) {
        return const LocationResult(
          success: false,
          message: 'Location unavailable at the moment.',
        );
      }

      final mapsUrl =
          'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

      return LocationResult(
        success: true,
        message: 'Location fetched successfully via $locationSource.',
        mapsUrl: mapsUrl,
      );
    } on TimeoutException {
      return const LocationResult(
        success: false,
        message: 'Location request timed out. Could not fetch GPS in time.',
      );
    } catch (_) {
      return const LocationResult(
        success: false,
        message: 'Location unavailable at the moment.',
      );
    }
  }
}
