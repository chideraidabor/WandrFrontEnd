import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wandr_frontend/controllers/eventController.dart';
import 'package:wandr_frontend/model/citiesInfo.dart';
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/services/apiManager.dart';
import 'package:wandr_frontend/views/pages/placePage.dart';
import 'package:wandr_frontend/widgets/ios_alert.dart';

import '../pages/pages.dart';

class SearchTab extends StatefulWidget {
  //SearchPage({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  double deviceHeight;
  double deviceWidth;
  TextEditingController searchController = new TextEditingController();
  List<PlaceInfo> places = [];
  List<CityInfo> cities = [];
  bool showPlaces = false;
  PlacePage place;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                title(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    searchBar(),
                    IconButton(
                        icon: Icon(Icons.tune),
                        onPressed: () {
                          //filter button code
                        })
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: showPlaces
                  ? Container(
                      child: ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Consumer<EventController>(
                            builder: (context, eventController, child) =>
                                cityContainer(context, index, eventController),
                          );
                        },
                      ),
                    )
                  : Container(height: 100.0, child: placesAndCities()),
            ),
          )
        ],
      ),
    );
  }

  Widget cityContainer(
    BuildContext context,
    int index,
    EventController eventController,
  ) {
    return InkWell(
      onTap: () {
        eventController.setId(places[index].placeId);
        print("I CLICKED");
        Navigator.of(context).push(
          MaterialPageRoute(
            //change
            builder: (context) => NewCalendarPage(
                //not supposed to pass in the search. pass the title of the
                //place. cities[index].cityName
                placeName: searchController.text),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          width: deviceWidth,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    // image: DecorationImage(image: NetworkImage(places[index].)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          places[index].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(places[index].location),
                        Row(
                          children: [
                            Text(places[index].description),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  placesAndCities() {
    return ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: deviceWidth / 1.1,
                    child: InkWell(
                      onTap: () async {
                        print("getting place data");
                        places = await API_Manager()
                            .getPlace(cities[index].cityName);
                        setState(() {
                          showPlaces = true;
                          // print(data);
                        });
                        return placeBuilder();
                      },
                      child: Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cities[index].cityName +
                                  ", " +
                                  cities[index].stateProvince,
                              //maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          );
          // }  // }ELSE
        });
  }

  ListView placeBuilder() {
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          //wrap here
          return InkWell(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      places[index].name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(places[index].location),
                  Text(places[index].description,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          );
        });
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      height: 55.0,
      width: deviceWidth / 1.2,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        controller: searchController,
        onChanged: (val) {
          if (showPlaces) {
            showPlaces = false;
            setState(() {});
          }
        },
        decoration: InputDecoration(
          hintText: 'Search City...',
          border: InputBorder.none,
          errorStyle: TextStyle(fontSize: 10),
          prefixIcon: Icon(
            Icons.location_on,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            color: Colors.red,
            //CHECK IF ANYTHING IS WRITTEN OR NOT
            onPressed: () async {
              if (searchController.text == '') {
                iosAlert(context: context, content: "Type a city");
              } else {
                print("getting data");
                var data = await API_Manager().getCity(searchController.text);
                setState(() {
                  print(data);
                  cities = data;
                });
              }
            },
          ),
          contentPadding: EdgeInsets.only(top: 15.0),
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.w600,
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter a city";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Find Activity",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 30.0,
        ),
      ),
    );
  }
}
