import 'package:dsc/detail_film/moviedata.dart';
import 'package:dsc/providers/filmProviders.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:dsc/models/filmModel.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FilmProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: prov.FilmList.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                final data = prov.FilmList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailScreen(item: prov.FilmList[index]),
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
                            data.cover,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                        Container(
                          child: Text(
                            data.title,
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
                );
              }),
        ),
      ),
    );
  }
}
