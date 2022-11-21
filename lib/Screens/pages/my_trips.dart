import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_aid/Screens/pages/trip_info.dart';
import 'package:travel_aid/repository/repo.dart';

class MyTrips extends StatelessWidget {
  final trips=CitesRepository.mytrips;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
        child: Column(
          children: <Widget>[
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("My Trips",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),),
                InkWell(onTap: (){
                  Navigator.pop(context);
                }, child: Icon(Icons.arrow_back,))
              ],
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: trips.length,
                  itemBuilder: (_,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (_) => TripInfo(
                              image: trips[index].image,
                              location: trips[index].location,
                              date: trips[index].date,
                            ),
                        ),);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on,
                                color: Colors.black,),
                                SizedBox(width: 5,),
                                Text(
                                    trips[index].location,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    child: Image.asset(
                                        trips[index].image,
                                        fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 48,
                                  left: 5,
                                  child: Container(
                                    child: Text(trips[index].title,
                                    style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                  ),
                                ),
                                Positioned(
                                  bottom: 28,
                                  left: 8,
                                  child: Container(
                                    child: Text(trips[index].loccap,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Container(
                                    child: Text(trips[index].date,
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
