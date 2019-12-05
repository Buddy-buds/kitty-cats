import 'dart:async';
import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<CatImage> fetchCatImage() async {
  final response = await http.get('https://aws.random.cat/meow');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return CatImage.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load CatImage');
  }
}

class CatImage {
  final String file;

  CatImage({this.file});

  factory CatImage.fromJson(Map<String, dynamic> json) {
    return CatImage(
      file: json['file'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<CatImage> catImage;

  @override
  void initState() {
    super.initState();
    catImage = fetchCatImage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random cats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random cats'),
        ),
        body: Center(
          child: FutureBuilder<CatImage>(
            future: catImage,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    RaisedButton(
                      child: Text("NEXT"),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          catImage = fetchCatImage();
                        });
                      },
                    ),
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: CircularProgressIndicator()),
                        ),
                        Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data.file,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
