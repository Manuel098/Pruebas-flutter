class ScanModel {
    int id;
    String type;
    String value;

    ScanModel({
        this.id,
        this.type,
        this.value,
    }){
      value.contains('MATMSG:') ? this.type ='mail': 
      value.contains('http://') || value.contains('https://') ? this.type ='http': 
      value.contains('geo:') ? this.type ='geo': 
      value.contains('WIFI:') ? this.type ='wifi': this.type ='text' ;
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
    };
}