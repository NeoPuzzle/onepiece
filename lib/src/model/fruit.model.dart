import 'dart:convert';

List<Fruits> fruitsFromJson(String str) => List<Fruits>.from(json.decode(str).map((x) => Fruits.fromJson(x)));

String fruitsToJson(List<Fruits> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fruits {
    int? id;
    String? name;
    String? romanName;
    String? type;
    String? description;
    String? filename;
    String? technicalFile;

    Fruits({
        this.id,
        this.name,
        this.romanName,
        this.type,
        this.description,
        this.filename,
        this.technicalFile,
    });

    factory Fruits.fromJson(Map<String, dynamic> json) => Fruits(
        id: json["id"],
        name: json["name"],
        romanName: json["roman_name"],
        type: json["type"],
        description: json["description"],
        filename: json["filename"],
        technicalFile: json["technicalFile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "roman_name": romanName,
        "type": type,
        "description": description,
        "filename": filename,
        "technicalFile": technicalFile,
    };
}