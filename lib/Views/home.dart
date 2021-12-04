import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islam_ahmed_opa_app/Views/detail_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFF21BFBD),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 15.0),
            // Setting all buttons of top app
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  //Setting Back button in the Menue
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                  color: Color(0xffffffff),
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Setting filter list button
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Color(0xffffffff),
                        ),
                      ),
                      //Setting Menu list button
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //---------------------------------------Opa Menu-----------------------------------
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                Text(
                  'Opa',
                  style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Menu',
                  style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          //-------------------------------------------------Making Opa Menu------------------
          Container(
            height: h - 185.0,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: h - 300,
                    child: ListView(
                      children: [
                        _buildFoodIteem('imgs/a.jpg', 'logo', '60.0\$'),
                        _buildFoodIteem('imgs/b.jpg', 'dish 1', '50.0\$'),
                        _buildFoodIteem('imgs/c.jpg', 'dish 2', '40.0\$'),
                        _buildFoodIteem('imgs/d.jpg', 'dish 3', '30.0\$'),
                        _buildFoodIteem('imgs/e.jpg', 'dish 4', '20.0\$'),
                        _buildFoodIteem('imgs/f.jpg', 'dish 5', '10.0\$')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

// ------------------------------widget to make list of dishes------------------------------------------
  Widget _buildFoodIteem(String imgPath, String foodName, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                  imgPath: imgPath, foodName: foodName, price: price)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0,
                      )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: GoogleFonts.montserrat(
                            //  textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 17,
                            //color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
                        style: GoogleFonts.montserrat(
                            //  textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
