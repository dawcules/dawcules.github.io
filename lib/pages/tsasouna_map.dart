import 'package:google_maps/google_maps.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:universal_ui/universal_ui.dart';

import 'package:flutter/material.dart';
//LatLng(60.41699, 24.31965);

class TsasounaMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getMap();
  }

  Widget getMap() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = new LatLng(60.41699, 24.31965);

      final mapOptions = new MapOptions()
        ..zoom = 7
        ..center = myLatlng;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = new GMap(elem, mapOptions);

      Map<int, Marker> markers = {};
      Map<int, InfoWindow> windows = {};

      var contentString1 = '<div id="content">' +
          '<div id="siteNotice">' +
          '</div>' +
          '<h1 id="firstHeading" class="firstHeading">Vihti</h1>' +
          '<div id="bodyContent">' +
          '<img src=' +
          'https://www.vihti.fi/wp-content/uploads/2016/02/Vaakuna_nettiin.jpg>' +
          '<p><b>Vihti</b>, Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque tincidunt nunc nec nibh laoreet pretium. Phasellus rhoncus luctus enim ut venenatis. Nullam laoreet bibendum ipsum ut efficitur. Curabitur in cursus erat, et pharetra felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam volutpat tellus eu leo pulvinar porta.</p>' +
          '<p>Kunnan sivut, <a href="https://www.vihti.fi/">' +
          'https://www.vihti.fi/</a> ' +
          '</p>' +
          '</div>' +
          '</div>';

      var contentString2 = '<div id="content">' +
          '<div id="siteNotice">' +
          '</div>' +
          '<h1 id="firstHeading" class="firstHeading">Espoo</h1>' +
          '<div id="bodyContent">' +
          '<img src=' +
          'https://www.espoo.fi/download/noname/%7B5ED4D8D7-2E24-456A-B591-F43911B80DF0%7D/86009>' +
          '<p><b>Espoo</b>, Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque tincidunt nunc nec nibh laoreet pretium. Phasellus rhoncus luctus enim ut venenatis. Nullam laoreet bibendum ipsum ut efficitur. Curabitur in cursus erat, et pharetra felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam volutpat tellus eu leo pulvinar porta.</p>' +
          '<p>Kunnan sivut, <a href="https://www.espoo.fi/">' +
          'https://www.espoo.fi/</a> ' +
          '</p>' +
          '</div>' +
          '</div>';

      var contentStrings = List(2);
      contentStrings[0] = contentString1;
      contentStrings[1] = contentString2;

      Set<Marker>.of(markers.values);
      var i = 0;
      while (i < 2) {
        markers[i] = Marker(MarkerOptions()
          ..position = LatLng((60.41699 + i), 24.31965)
          ..map = map
          ..title = i.toString());
        var titleNum = int.parse(markers[i].title);
        windows[i] = InfoWindow(
            InfoWindowOptions()..content = contentStrings[i].toString());
        markers[i].onClick.listen((event) {
          print(titleNum);
          windows[titleNum].open(map, markers[titleNum]);
        });
        i++;
      }
      print(windows[0]);

      /* final marker = Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!');

      final marker2 = Marker(MarkerOptions()
        ..position = LatLng(60.205490, 24.655899)
        ..map = map
        ..title = 'Toinen merkki');

     

      final infoWindow =
          InfoWindow(InfoWindowOptions()..content = contentString1);
      marker.onClick.listen((event) => infoWindow.open(map, marker));
       */

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
