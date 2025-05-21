import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'new_address_state.freezed.dart';

enum Status { idle, loading, loaded, success, error, selected }

@freezed
abstract class NewAddressState with _$NewAddressState {
  const factory NewAddressState({
    required LatLng? currentLocation,
    required String? address,
    required List<Marker> markers,
    required Status status,
  }) = _NewAddressState;

  factory NewAddressState.initial() {
    return NewAddressState(currentLocation: null, address: null, status: Status.idle, markers: []);
  }
}
