import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final imgPath;
  final foodName;
  final price;
  DetailPage({this.imgPath, this.foodName, this.price});
  //const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var selectedCard = 'WEIGHT';
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        //backgroundColor: Colors.transparent,
        title: Text(
          'Details',
          style: GoogleFonts.montserrat(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: h - 82,
                width: w,
                color: Colors.blueAccent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: h - 100,
                  width: w,
                ),
              ),
              Positioned(
                top: 30.0,
                left: (w / 2) - 100,
                child: Hero(
                  tag: widget.imgPath,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                    ),
                  ),
                ),
                width: 200,
                height: 200,
              ),
              Positioned(
                top: 250,
                left: 25,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodName,
                      style: GoogleFonts.montserrat(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.price,
                          style: GoogleFonts.montserrat(
                              fontSize: 22, color: Colors.grey),
                        ),
                        Container(
                          height: 25,
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 40,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Color(0xFF7A9BEE),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color(0xFF7A9BEE),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  )),
                              Text(
                                '1',
                                style: GoogleFonts.montserrat(
                                    fontSize: 22, color: Colors.white),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color(0xFF7A9BEE),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        _buildInfoCard('height', '500c', 'G'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildInfoCard('low', '100c', 'G'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildInfoCard('medium', '300c', 'G'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildInfoCard('larg', '400c', 'G'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildInfoCard('small', '200c', 'G'),
                        SizedBox(
                          width: 10,
                        ),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        SelectedCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardTitle == selectedCard
                ? Colors.transparent
                : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 25,
          ),
        ),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: cardTitle == selectedCard ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
                child: Column(
                  children: [
                    Text(
                      info,
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: cardTitle == selectedCard
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Text(
                      unit,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: cardTitle == selectedCard
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  SelectedCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
