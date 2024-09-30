import 'dart:convert';

List<OnePieceCharacter > charactersFromJson(String str) => List<OnePieceCharacter >.from(json.decode(str).map((x) => OnePieceCharacter .fromJson(x)));

String charactersToJson(List<OnePieceCharacter > data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnePieceCharacter  {
    int? id;
    String? name;
    String? job;
    String? size;
    String? birthday;
    String? age;
    String? bounty;
    String? status;
    Crew? crew;
    Fruit? fruit;

    OnePieceCharacter ({
        this.id,
        this.name,
        this.job,
        this.size,
        this.birthday,
        this.age,
        this.bounty,
        this.status,
        this.crew,
        this.fruit,
    });

    factory OnePieceCharacter .fromJson(Map<String, dynamic> json) => OnePieceCharacter (
        id: json["id"],
        name: json["name"],
        job: json["job"],
        size: json["size"],
        birthday: json["birthday"],
        age: json["age"],
        bounty: json["bounty"],
        status: json["status"],
        crew: json["crew"] != null ? Crew.fromJson(json["crew"]) : null,
        fruit: json["fruit"] != null ? Fruit.fromJson(json["fruit"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "job": job,
        "size": size,
        "birthday": birthday,
        "age": age,
        "bounty": bounty,
        "status": status,
        "crew": crew?.toJson(),
        "fruit": fruit?.toJson(),
    };
}

class Crew {
    int? id;
    String? name;
    String? description;
    String? status;
    String? number;
    String? romanName;
    String? totalPrime;
    bool? isYonko;

    Crew({
        this.id,
        this.name,
        this.description,
        this.status,
        this.number,
        this.romanName,
        this.totalPrime,
        this.isYonko,
    });

    factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        number: json["number"],
        romanName: json["roman_name"],
        totalPrime: json["total_prime"],
        isYonko: json["is_yonko"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
        "number": number,
        "roman_name": romanName,
        "total_prime": totalPrime,
        "is_yonko": isYonko,
    };
}

class Fruit {
    int? id;
    String? name;
    String? description;
    String? type;
    String? filename;
    String? romanName;
    String? technicalFile;

    Fruit({
        this.id,
        this.name,
        this.description,
        this.type,
        this.filename,
        this.romanName,
        this.technicalFile,
    });

    factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        filename: json["filename"],
        romanName: json["roman_name"],
        technicalFile: json["technicalFile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "filename": filename,
        "roman_name": romanName,
        "technicalFile": technicalFile,
    };
}