// To parse this JSON data, do
//
//     final getLatitude = getLatitudeFromJson(jsonString);

import 'dart:convert';

List<List<GetLatitude>> getLatitudeFromJson(String str) => List<List<GetLatitude>>.from(json.decode(str).map((x) => List<GetLatitude>.from(x.map((x) => GetLatitude.fromJson(x)))));

String getLatitudeToJson(List<List<GetLatitude>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class GetLatitude {
    GetLatitude({
        required this.id,
        required this.slug,
        required this.citySlug,
        required this.display,
        required this.asciiDisplay,
        required this.cityName,
        required this.cityAsciiName,
        required this.state,
        required this.country,
        required this.lat,
        required this.long,
        required this.resultType,
        required this.popularity,
        required this.sortCriteria,
    });

    int id;
    String slug;
    String citySlug;
    String display;
    String asciiDisplay;
    String cityName;
    String cityAsciiName;
    String state;
    String country;
    String lat;
    String long;
    String resultType;
    String popularity;
    double sortCriteria;

    factory GetLatitude.fromJson(Map<String, dynamic> json) => GetLatitude(
        id: json["id"],
        slug: json["slug"],
        citySlug: json["city_slug"],
        display: json["display"],
        asciiDisplay: json["ascii_display"],
        cityName: json["city_name"],
        cityAsciiName: json["city_ascii_name"],
        state: json["state"],
        country: json["country"],
        lat: json["lat"],
        long: json["long"],
        resultType: json["resultType"],
        popularity: json["popularity"],
        sortCriteria: json["sort_criteria"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "city_slug": citySlug,
        "display": display,
        "ascii_display": asciiDisplay,
        "city_name": cityName,
        "city_ascii_name": cityAsciiName,
        "state": state,
        "country": country,
        "lat": lat,
        "long": long,
        "result_type": resultType,
        "popularity": popularity,
        "sort_criteria": sortCriteria,
    };
}




