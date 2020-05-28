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
  bool _search = true;
  String _API_KEY = 'API_KEY';

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
              _search
                  ? CircularProgressIndicator()
                  : Expanded(
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

  Future _responseJson() async {
    var url =
        'http://api.themoviedb.org/3/search/movie?/&query=Movie&api_key=$_API_KEY';
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _results = MovieResponse.parseResults(response.data['results']);
        _search = false;
      });
    } else {
      throw Exception('An error occurred getting places nearby');
    }
    return _dio.get(url);
  }
}
