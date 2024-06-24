import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/src/extensions/extensions.dart';

import '../../../common_widgets/common_widgets.dart';
import 'dart:ui' as ui;

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with TickerProviderStateMixin {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(33.6995, 73.0363),
    zoom: 12,
  );

  double width = 200;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        width = MediaQuery.sizeOf(context).width * 0.7;
      });
    });
    _addMarkers();
  }

  late BitmapDescriptor customIcon;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> _addMarkers() async {
    List<LatLng> markerPositions = const [
      LatLng(33.6995, 73.0363),
      LatLng(33.7077, 73.0247),
      LatLng(33.7296, 73.0368),
      LatLng(33.7601, 73.0657),
      LatLng(33.6824, 72.9909),
    ];

    List<String> markerLabels = [
      "San Francisco",
      "Los Angeles",
      "Las Vegas",
      "New York",
      "Chicago"
    ];

    final Uint8List markerIcon =
        await getBytesFromAsset('assets/marker.png', 100);

    for (int i = 0; i < markerPositions.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(markerPositions[i].toString()),
          position: markerPositions[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: markerLabels[i],
            snippet:
                '${markerPositions[i].latitude}, ${markerPositions[i].longitude}',
          ),
        ),
      );
    }

    setState(() {});
  }

  setStyleOfMap(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style.json");
    controller.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              setStyleOfMap(_controller!);
            },
            markers: _markers,
          ),
          Positioned(
            top: 50,
            left: 30,
            right: 30,
            child: Row(
              children: [
                AnimatedContainer(
                  height: 44,
                  width: width,
                  // MediaQuery.sizeOf(context).width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  child: Center(
                    child: TextField(
                      controller:
                          TextEditingController(text: "Saint Petersburg"),
                      style: GoogleFonts.poppins(
                        color: HexColor("#000000"),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Asnaknakjnkj",
                        hintStyle: GoogleFonts.poppins(
                          color: HexColor("#757575"),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: const EdgeInsets.only(
                          top: 8,
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/search_outline.svg",
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                12.width,
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/filter.svg",
                      height: 15,
                      width: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor("#717171").withOpacity(0.8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/navigate.svg",
                      height: 15,
                      width: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                12.width,
                Container(
                  height: 36,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  decoration: BoxDecoration(
                    color: HexColor("#717171").withOpacity(0.8),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          "assets/list.svg",
                          height: 15,
                          width: 15,
                          color: Colors.white,
                        ),
                        CommonTextWidget(
                          text: "List of variants",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          textColor: HexColor("#FFFFFF"),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor("#717171").withOpacity(0.8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/navigate.svg",
                      height: 15,
                      width: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                12.width,
                Container(
                  height: 36,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  decoration: BoxDecoration(
                    color: HexColor("#717171").withOpacity(0.8),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          "assets/list.svg",
                          height: 15,
                          width: 15,
                          color: Colors.white,
                        ),
                        CommonTextWidget(
                          text: "List of variants",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          textColor: HexColor("#FFFFFF"),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 140,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor("#717171").withOpacity(0.8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/stack.svg",
                      height: 15,
                      width: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                12.width,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
