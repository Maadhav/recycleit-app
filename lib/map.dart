import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Map extends StatefulWidget {
  Map();
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  MapController _controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[map(), shops()],
    ));
  }

  map() {
    return FlutterMap(
      options: new MapOptions(
        center: new LatLng(23.022505, 72.571365),
        zoom: 12.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/maadhav/ck62z4y9608tp1imgfmifv2iu/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFhZGhhdiIsImEiOiJjazYyeWpheW4waHNuM2xxMWNhcTdjYW9hIn0.-BpvXTThii-bYskmF838cg",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoibWFhZGhhdiIsImEiOiJjazYyeWpheW4waHNuM2xxMWNhcTdjYW9hIn0.-BpvXTThii-bYskmF838cg',
            'id': 'mapbox.mapbox-streets-v8',
          },
        ),
        MarkerLayerOptions(markers: [
          marker(23.022505, 72.571365),
          marker(22.997713, 72.602133),
          marker(23.038412, 72.56),
          marker(23.038412, 72.62),
          marker(23.076215, 72.576615),
          marker(23.041467, 72.528584),
        ])
      ],
    );
  }

  marker(double a, double b) {
    return Marker(
        width: 45.0,
        height: 45.0,
        point: new LatLng(a, b),
        builder: (context) =>
            new Container(child: Image.asset('assets/map.png')));
  }

  shops() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMmNuvrmKKC4S1GP8czskZFXVC79ZJJpWJzfbZR=s580-k-no",
                  40.738380,
                  -73.988426,
                  "FORNNAX Technology"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  const url =
                      'https://www.google.com/maps/search/?api=1&query=Pruthvi+e-recycle+Pvt.+Ltd.';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: _boxes(
                    "http://www.pruthvierecycle.com/images/benefits_img.jpg",
                    40.761421,
                    -73.981667,
                    "Pruthvi e-recycle"),
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128,
                  -73.999619,
                  "Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return Container(
      child: new FittedBox(
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer1(restaurantName),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "All Items Accepted \ 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
