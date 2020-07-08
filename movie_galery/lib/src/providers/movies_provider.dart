import 'package:movie_galery/src/models/actors_model.dart';
import 'package:movie_galery/src/models/movie_model.dart';
import 'package:movie_galery/src/utils/keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MoviesProvider {
  final String _apiKey = getKey('movieApi');
  final String _url = 'api.themoviedb.org';
  String _language = 'es-Mx';
  String _region = 'Mx';
  bool _loading = false;
  int _pagePopulars = 0;

  List<Movie> _populars = List<Movie>();

  final StreamController _popularStreamController = StreamController<List<Movie>>.broadcast();

  Function( List<Movie> ) get popularsSink => _popularStreamController.sink.add;  
  Stream<List<Movie>> get popularsStream => _popularStreamController.stream;

  void disposeStreams(){
    _popularStreamController?.close();
  }

  Future<List<Actor>> getActors( String movieId) async{
    final url = Uri.https(_url, '3/movie/$movieId/credits',{
      'api_key': _apiKey,
    });

    final res = await http.get(url);
    final decodeData = json.decode(res.body);

    final casting = Actors.fromJson(decodeData['cast']);

    return casting.actors;
  }

  Future<List<Movie>> getOnCinema() async{
    final ruta = Uri.https(_url, '3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
      'region': _region
    });

    return await _response( ruta );
  }

  void getPopulars() async{
    if(!_loading){
      _loading = true;
      _pagePopulars++;
      final ruta = Uri.https(_url, '3/movie/popular',{
        'page' : _pagePopulars.toString(),
        'language': _language,
        'api_key': _apiKey,
        'region': _region
      });

      final response = await _response( ruta );

      _populars.addAll( response );
      popularsSink(_populars);
      _loading = false;
    }
  }  

  Future<Map<String, String>> getTrailer( String movieId) async{
    final url = Uri.https(_url, '3/movie/$movieId/videos',{
      'api_key': _apiKey,
      'language': _language
    });

    final res = await http.get(url);
    final decodeData = json.decode(res.body);
    Map<String, String> data = {
      'plataform' : decodeData['results'][0]['site'],
      'key' : decodeData['results'][0]['key'],
      'name' : decodeData['results'][0]['name']
    };
    return data;
    
  }

  Future<List<Movie>> _response(Uri url) async{
    final res = await http.get(url);
    final decodeData = json.decode(res.body);

    final Movies movies = Movies.fromJonList(decodeData['results']);
    
    return movies.items;
  }

  Future<List<Movie>> fetchMovies(String query) async{
    final ruta = Uri.https(_url, '3/search/movie',{
      'include_adult' : 'true',
      'language' : _language,
      'api_key' : _apiKey,
      'region' : _region,
      'query' : query
    });
    return await _response( ruta );
  }
}