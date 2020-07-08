class Actors {
  List<Actor> actors = List<Actor>();

  Actors.fromJson(List<dynamic> jsonList){
    if( jsonList == null ) return;
    jsonList.forEach((e) {
      final actor = Actor.fromJsonMap(e);
      
      actors.add(actor);
    });
  }
}

class Actor {
  String profilePath;
  String character;
  String creditId;
  int castId;
  int gender;
  String name;
  int order;
  int id;

  Actor({
    this.profilePath,
    this.character,
    this.creditId,
    this.castId,
    this.gender,
    this.order,
    this.name,
    this.id,
  });

  Actor.fromJsonMap(Map<String, dynamic> json){
    profilePath = json['profile_path'];
    character = json['character'];
    creditId = json['credit_id'];
    castId = json['cast_id'];
    gender = json['gender'];
    order = json['order'];
    name = json['name'];
    id = json['id'];
  }

  String getActorImg(){
    return profilePath == null ? 'no image'
      :'https://image.tmdb.org/t/p/w500$profilePath';
  }
}
