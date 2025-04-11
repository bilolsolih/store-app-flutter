import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/address/managers/new_address_bloc.dart';
import 'package:store_app/features/address/managers/new_address_events.dart';
import 'package:store_app/features/address/managers/new_address_state.dart';

import '../../common/widgets/store_icon_button.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 64.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: StoreIconButton(
              icon: "assets/icons/back_arrow.svg",
              width: 19.w,
              height: 16.h,
              callback: () => context.pop(),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "New Address",
          style: TextStyle(color: AppColors.primary, fontSize: 24.r, fontWeight: FontWeight.w600),
        ),
        actionsPadding: EdgeInsets.only(right: 16.w),
        actions: [StoreIconButton(icon: "assets/icons/notification.svg", width: 24.r, height: 24.r, callback: () {})],
      ),
      body: BlocBuilder<NewAddressBloc, NewAddressState>(
        builder:
            (context, state) => Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: context.read<NewAddressBloc>().controller,
                    options: MapOptions(
                      initialCenter: LatLng(41.285799883900715, 69.20363493014382),
                      onTap:
                          (tapPosition, point) =>
                              context.read<NewAddressBloc>().add(NewAddressChooseLocation(chosenLocation: point)),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: state.markers),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(16.0), child: Text('Address: ${state.address}')),
              ],
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<NewAddressBloc>().add(GoToCurrentLocation()),
        tooltip: 'Go to current location',
        child: Icon(Icons.my_location),
      ),
    );
  }
}
