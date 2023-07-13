import 'package:dsc/detail_film/moviedata.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:dsc/models/filmModel.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  var uuid = Uuid();
  List<FilmItem> listData = [
    FilmItem(
      id: Uuid().v1(),
      cover: "gambar1.jpg",
      title: "Flower",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      genre: "Action, Adventure",
      time: "49 Menit",
      creator: 'Josh Applebaum, Bryan Oh, David Weil',
    ),
    FilmItem(
      id: Uuid().v1(),
      cover: "gambar2.jpeg",
      title: "Demon Slayer : Kimetsu No Yeiba",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      genre: "Korea",
      time: "49 Menit",
      creator: 'Josh Applebaum, Bryan Oh, David Weil',
    ),
    FilmItem(
      id: Uuid().v1(),
      cover: "gambar8.jpeg",
      title: "Jhon Wick Chapter 4",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      genre: "Action, Adventure",
      time: "49 Menit",
      creator: 'Josh Applebaum, Bryan Oh, David Weil',
    ),
    FilmItem(
      id: Uuid().v1(),
      cover: "gambar4.jpg",
      title: "The Long Season",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      genre: "Action, Adventure",
      time: "49 Menit",
      creator: 'Josh Applebaum, Bryan Oh, David Weil',
    ),
    FilmItem(
      id: Uuid().v1(),
      cover: "gambar7.jpeg",
      title: "The Super Mario Bross Movie",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      genre: "Action, Adventure",
      time: "49 Menit",
      creator: 'Josh Applebaum, Bryan Oh, David Weil',
    ),
    FilmItem(
      id: Uuid().v1(),
      cover: "gambar6.jpeg",
      title: "Evil Death Rise",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      genre: "Action, Adventure",
      time: "49 Menit",
      creator: 'Josh Applebaum, Bryan Oh, David Weil',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listData.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailScreen(item: listData[index]),
                  ),
                );
              },
              child: Card(
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Image.asset(
                        listData[index].cover,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Container(
                      child: Text(
                        listData[index].title,
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
            ),
          ),
        ),
      ),
    );
  }
}
