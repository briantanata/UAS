import 'package:dsc/detail_film/booking.dart';
import 'package:dsc/models/filmModel.dart';
import 'package:dsc/providers/filmProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({required this.item});

  final FilmItem item;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  TextEditingController _image = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<FilmProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('XXI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.0, top: 15, bottom: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text('18+'),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Action,Adventure'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Card(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              widget.item.cover,
                              fit: BoxFit.cover,
                              height: 200,
                              width: 150,
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              widget.item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              softWrap: false,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.alarm),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(widget.item.time),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Card(
                                shadowColor: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('2D'),
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('R13+'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: prov.FilmList.contains(widget.item)
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : Icon(Icons.favorite_border),
                                onPressed: () {
                                  if (!prov.FilmList.contains(widget.item)) {
                                    prov.addFavorite(widget.item);
                                  } else {
                                    prov.removeFavorite(widget.item);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text('PLAYING AT'),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, bottom: 10, top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text('BUY TICKET'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text('TRAILER'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 20),
                width: 500,
                child: Text(
                  widget.item.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: false,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 15, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Creators',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        widget.item.creator,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        'Stars',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'Josh Applebaum, bryan Oh, David Well',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        'Cast',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      width: 500,
                      child: Text(
                        "Anime One Piece menceritakan perjalanan Luffy, seorang anak laki-laki yang bertemu bajak laut hebat bernama Shanks, dimana Luffy terinspirasi oleh kehebatan Shanks dan bermimpi suatu hari nanti ingin menjadi bajak laut. Kemudian Shanks menjanjikan Luffy untuk reuni di masa depan dan memberikan topi jeraminya .",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
