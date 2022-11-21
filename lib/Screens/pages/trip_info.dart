

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_aid/repository/repo.dart';

class TripInfo extends StatefulWidget {
  final String image;
  final String location;
  final String date;

  const TripInfo({Key? key, required this.image, required this.location, required this.date}) : super(key: key);

  @override
  State<TripInfo> createState() => _TripInfoState();
}

class _TripInfoState extends State<TripInfo> {
  final trips = CitesRepository.mytrips;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _headerWidget(),
            _body()
          ],
        ),
      ),
    );
  }

   Widget _headerWidget() {
    return Stack(
      children: <Widget>[
        Container(
          height: 180,
          child: Image.asset("assets/cover.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 35,right: 10,left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Trip Information",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back))
                ],
              ),
              SizedBox(height: 10,),
              Text(widget.location,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            ],
          ),
        )
      ],
    );
   }

  Widget _body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trips.length,
                itemBuilder: (_,index){
                  return Container(
                    margin: EdgeInsets.only(right: 15,),
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                      child: Image.asset(
                        trips[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
            ),
          ),
          SizedBox(height: 10,),
          Text("My first trip to ${widget.location}",
            style:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Travelled on - ${widget.date}",
            style: TextStyle(
              color: Colors.black.withOpacity(.6)
            ),
          ),
          SizedBox(height: 15,),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(
                color: Colors.black.withOpacity(.8),
              ),
          ),
          SizedBox(height: 15,),
        Container(
        height: 150,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15),
          ),
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
            ),
          ),
        ),
          SizedBox(height: 15,),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(
              color: Colors.black.withOpacity(.8),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 40,
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1)
            ),
              child: Text(
                "Read more..",
                style: TextStyle(
                  color: Colors.black
                ),
              ),
          ),
        ],
      ),
    );
  }
}
