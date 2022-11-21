
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_aid/Screens/pages/my_trips.dart';
import 'package:travel_aid/repository/repo.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _searchController = TextEditingController();
  final _famousdestinations = CitesRepository.famousdestinations;
  final _friends= CitesRepository.friends;
  final _trendingspots=CitesRepository.cities;

  @override
  void dispose(){
    _searchController.dispose();
    // TODO; implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15,),
              _headerWidget(),
              SizedBox(height: 15,),
              _searchWidget(),
              SizedBox(height: 15,),
              _bodyContainer()
            ],
          ),
        ),
      ),
    );
  }

  // contains the title bar
  Widget _headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Travel Kenya",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        // action allowing button to function
        InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => MyTrips(),
            ),);
        },child: Image.asset("assets/menu.png"),
        ),
      ],
    );
  }

  // allows you to search for places
  Widget _searchWidget() {
    return Container(
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Look for a place!!..",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic)
        ),
      ),
    );
  }

  // Contains contents of the app
  Widget _bodyContainer() {
    return  Column(
      children: <Widget>[
        _famousDestinations(),
        SizedBox(height: 10,),
        _friendList(),
        SizedBox(height: 10,),
        _trendingCities(),
        SizedBox(height: 10,),
        _travelWithFriendList(),
      ],
    );
  }

  // contains the best places to tour
  Widget _famousDestinations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Famous attractions",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("View all",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.3)
                )
            ),
          ],
        ),
        SizedBox(height: 15,),
        Container(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:_famousdestinations.length,
            shrinkWrap: true,
            itemBuilder: (_,index){
              return Container(
                width: 180,
                height: 200,
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width:180,
                          height: 180,
                          child: ClipRRect(borderRadius:
                          BorderRadius.all(Radius.circular(15),
                          ),
                          child: Image.asset(
                            _famousdestinations[index].image,
                            fit: BoxFit.cover,
                          )),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                            child: Text(
                              "${_famousdestinations[index].caption}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(.4)
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(.5),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                            child: Text(
                              "${_famousdestinations[index].activeFriends} Active Friends",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(.7)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "${_famousdestinations[index].name}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),

              );
            },),
        )
      ],
    );
  }

  Widget _friendList() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _friends.length,
              shrinkWrap: true,
              itemBuilder: (_,index){
                return Container(
                  margin: EdgeInsets.only(right: 15.0),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(.2),width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(35))
                  ),
                  child: ClipRRect(
                      borderRadius:BorderRadius.all(Radius.circular(30)),
                      child: Image.asset(_friends[index].image,
                      fit: BoxFit.cover,)),
                );
              },),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Icon(Icons.add,color: Colors.white,),
        )
      ],
    );
  }

  _travelWithFriendList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Travel with an acquintance",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
            ),
            Text("View all",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.3)
                )
            ),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          height: 55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _friends.length,
            shrinkWrap: true,
            itemBuilder: (_,index){
              return Container(
                margin: EdgeInsets.only(right: 15.0),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(.2),width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(35))
                ),
                child: ClipRRect(
                    borderRadius:BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(_friends[index].image,
                      fit: BoxFit.cover,)),
              );
            },),
        )
      ],
    );
  }

  _trendingCities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Trending places",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            Text("View all",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.3)
                )
            ),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          height: 140,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _trendingspots.length,
            itemBuilder: (_,index){
              return Container(
                margin: EdgeInsets.only(right: 15),
                height: 140,
                width: 140,
                child: Image.asset(
                  _trendingspots[index].image,
                  fit: BoxFit.cover,),
              );
            },
          ),
        )
      ],
    );
  }
}
