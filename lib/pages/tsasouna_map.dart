import 'package:google_maps/google_maps.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:universal_ui/universal_ui.dart';

import 'package:flutter/material.dart';
//LatLng(60.41699, 24.31965);

class TsasounaMap extends StatelessWidget {
  TsasounaMap({Key key, this.documents}) : super(key: key);

  final documents;

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

      //List<String> contentStrings = [];

      print('PITUUS: ' + documents.docs.length.toString());
      Set<Marker>.of(markers.values);
      var i = 0;
      while (i < documents.docs.length) {
        markers[i] = Marker(MarkerOptions()
          ..position = LatLng((double.parse(documents.docs[i]['long'])),
              double.parse(documents.docs[i]['lat']))
          ..map = map
          ..title = i.toString());
        var titleNum = int.parse(markers[i].title);
        windows[i] = InfoWindow(InfoWindowOptions()
          ..content = '<div id="content">' +
              '<div id="siteNotice">' +
              '</div>' +
              '<h1 id="firstHeading" class="firstHeading">${documents.docs[i]['county']}</h1>' +
              '<div id="bodyContent">' +
              '<img src=' +
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tsasouna_Muhos.jpg/480px-Tsasouna_Muhos.jpg>' +
              '<p><b>${documents.docs[i]['county']}</b>, Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque tincidunt nunc nec nibh laoreet pretium. Phasellus rhoncus luctus enim ut venenatis. Nullam laoreet bibendum ipsum ut efficitur. Curabitur in cursus erat, et pharetra felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam volutpat tellus eu leo pulvinar porta.</p>' +
              '<p>Kunnan sivut, <a href="https://www.espoo.fi/">' +
              'https://www.espoo.fi/</a> ' +
              '</p>' +
              '</div>' +
              '</div>');
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
