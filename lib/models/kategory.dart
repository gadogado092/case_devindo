import 'dart:convert';

List<Kategory> kategoryFromJson(String str) => List<Kategory>.from(json.decode(str).map((x) => Kategory.fromJson(x)));

String kategoryToJson(List<Kategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kategory {
    Kategory({
        required this.title,
        required this.content,
    });

    String title;
    List<Content> content;

    factory Kategory.fromJson(Map<String, dynamic> json) => Kategory(
        title: json["title"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class Content {
    Content({
        required this.title,
        required this.code,
        required this.subtitle,
    });

    String title;
    String code;
    String subtitle;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        code: json["code"],
        subtitle: json["subtitle"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "subtitle": subtitle,
    };
}
