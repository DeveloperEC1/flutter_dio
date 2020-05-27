import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdio/models/place_response.dart';
import 'package:flutterdio/models/results.dart';

class DioExample extends StatefulWidget {
  DioExample({Key key}) : super(key: key);

  @override
  _DioExampleState createState() => _DioExampleState();
}

class _DioExampleState extends State<DioExample> {
  List<Results> _results = List();
  Dio _dio = new Dio();

  @override
  void initState() {
    super.initState();

    _responseJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _results.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(_results[i].title),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _getUsers() {
    var url =
        'http://api.themoviedb.org/3/search/movie?/&query=movie&api_key=API_KEY';
    return _dio.get(url);
  }

  Future _responseJson() async {
    _getUsers().then((response) {
      setState(() {
        _results = MovieResponse.parseResults(response.data['results']);
        print(_results[0].title);
      });
    });
  }
}
