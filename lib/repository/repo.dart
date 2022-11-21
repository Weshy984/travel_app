import 'package:travel_aid/model/famous_destinations.dart';
import 'package:travel_aid/model/friends.dart';
import 'package:travel_aid/model/trending_cities.dart';
import 'package:travel_aid/model/trips.dart';

class CitesRepository {
  static List<FamousDestinations> famousdestinations = [
    FamousDestinations(
        caption:"",
        name: "Ngare Ndare Forest Reserve",
        image: "assets/NDARE3.jpg",
        activeFriends: "20.5k"),
    FamousDestinations(
        caption:"",
        name: "Nairobi National Park",
        image: "assets/NNP.jpg",
        activeFriends: "40.3k"),
    FamousDestinations(
        caption:"",
        name: "Mida Creek",
        image: "assets/CREEK4.jpg",
        activeFriends: "12.6k"),
    FamousDestinations(
        caption:"",
        name: "Mt Kenya National Park",
        image: "assets/KENYA3.jpg",
        activeFriends: "280.7k"),
    FamousDestinations(
        caption:"",
        name: "Oloolua Nature Trail",
        image: "assets/oloolua-nature-trail.jpg",
        activeFriends: "17.9k"),
    FamousDestinations(
        caption:"",
        name: "Marafu Hells Kitchen",
        image: "assets/marafa3.jpg",
        activeFriends: "54.6k"),
    FamousDestinations(
        caption:"",
        name: "Hells Gate National Park",
        image: "assets/marafa3.jpg",
        activeFriends: "130.9k"),
  ];

  static List<FriendsData> friends = [
    FriendsData(image: "assets/user1.jpg"),
    FriendsData(image: "assets/user2.jpeg"),
    FriendsData(image: "assets/user3.jpg"),
    FriendsData(image: "assets/user4.jpg"),
    FriendsData(image: "assets/user5.jpeg"),
    FriendsData(image: "assets/user6.jpeg"),
    FriendsData(image: "assets/user7.jpg"),
    FriendsData(image: "assets/user8.jpg"),
  ];

  static List<TrendingCities> cities =[
    TrendingCities(image: "assets/nbo.jpg"),
    TrendingCities(image: "assets/nks.webp"),
    TrendingCities(image: "assets/mba.jpg"),
    TrendingCities(image: "assets/nny.jpg"),
    TrendingCities(image: "assets/ksm.jpg"),
    TrendingCities(image: "assets/nvs2.jpg"),
  ];

  static List<Trips> mytrips=[
    Trips(
        title: "The great Mt Kenya",
        date: "2020/02/06",
        location: "Central Kenya",
        loccap: "Central Kenya",
        image: "assets/KENYA1.jpg"
    ),
    Trips(
        title: "Best of Kisumu",
        date: "2019/12/12",
        location: "Kisumu",
        loccap: "Kisumu",
        image: "assets/ksm2.jpg"
    ),
    Trips(
        title: "Best of Nanyuki",
        date: "2022/05/15",
        location: "Nanyuki",
        loccap: "Nanyuki",
        image: "assets/NDARE3.jpg"
    ),
    Trips(
        title: "Malindi beaches",
        date: "2021/12/24",
        location: "Malindi",
        loccap: "Malindi",
        image: "assets/kenya-malindi.jpg"
    ),
    Trips(
        title: "Famous Mombasa",
        date: "2019/07/15",
        location: "Mombasa",
        loccap: "Mombasa",
        image: "assets/mba2.jpg"
    ),
  ];
}
