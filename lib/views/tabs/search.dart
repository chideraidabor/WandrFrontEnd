import 'package:flutter/material.dart';
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/services/api_manager.dart';
import 'package:wandr_frontend/services/loginAPI.dart';

class searchPage extends StatefulWidget {



  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
 // bool _isLoading = false;

  TextEditingController searchController = new TextEditingController();
  List<PlaceInfo> places = [];

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;


    final pageTitle = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Find Activity",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 30.0,
          ),
        )
    );


    final listOfPlaces = Container(
        height: 100.0,
      child: ListView.builder(
        itemCount: places.length,
                itemBuilder: (context, index){
              return Container(
                height: 100,
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget> [
                    Card(
                     //SizedBox(width: 16)
                    child: Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(places[index].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text(places[index].location),
                          Text(places[index].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis
                            ,),
                          Text(places[index].type),
                        ],
                      ),
                    )
                    ),
                  ],
                ),
              );
            })
      );

    final searchBar = Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      height: 50.0,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),

      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.location_on,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon:Icon(Icons.search),
            color:Colors.red,
            onPressed:  () async {
              //LoginAPI().signIn("hanzomain@gmail.com","q1w2e3r4");
             //get json Data
              print("getting data");
              var data = await API_Manager().getPlace(searchController.text);
              setState(() {
                print(data);
                places = data;
              });
            },
          ),
          contentPadding: EdgeInsets.only(top: 15.0),
          hintText: 'Search City...',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );


    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 30.0,
            right: 30.0,
            bottom: 30.0,
          ),
          height: deviceHeight,
          width: deviceWidth,
          child: Column(
            children: <Widget>[
              pageTitle,
              searchBar,
              listOfPlaces
              //listOfEvents,
            ],
          ),
        )
    );
  }
}
