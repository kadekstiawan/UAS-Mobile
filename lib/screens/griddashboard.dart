import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Iron Man",
      subtitle: "Official",
      event: "13 K",
      img: "assets/images/ironman.png");

  Items item2 = new Items(
    title: "The Queen's Gambit",
    subtitle: "Official",
    event: "10 K",
    img: "assets/images/strategy.png",
  );
  Items item3 = new Items(
    title: "Clover",
    subtitle: "Creators",
    event: "20 K",
    img: "assets/images/clover.png",
  );
  Items item4 = new Items(
    title: "Sakura",
    subtitle: "Official",
    event: "Free",
    img: "assets/images/sakura.png",
  );
  Items item5 = new Items(
    title: "Ice Cream",
    subtitle: "Creators",
    event: "15 K",
    img: "assets/images/ice-cream.png",
  );
  Items item6 = new Items(
    title: "Spiderman",
    subtitle: "Creators",
    event: "Free",
    img: "assets/images/spiderman.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
