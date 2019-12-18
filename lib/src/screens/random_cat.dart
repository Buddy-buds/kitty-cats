import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:test_app/src/blocs/cat_bloc.dart';
import 'package:test_app/src/models/cat_model.dart';

class RandomCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchRandomCat();
    return Scaffold(
      appBar: AppBar(
        title: Text('Random cats'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.randomCat,
          builder: (context, snapshot) => snapshot.hasData
              ? buildCatImage(snapshot)
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget buildCatImage(AsyncSnapshot<CatModel> snapshot) => ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          RaisedButton(
            child: Text("Random"),
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () => bloc.fetchRandomCat(),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: snapshot.data.image.file,
                ),
              ),
            ],
          ),
        ],
      );
}
