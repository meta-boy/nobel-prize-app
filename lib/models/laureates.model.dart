// To parse this JSON data, do
//
//     final laureatesResponse = laureatesResponseFromJson(jsonString);

import 'dart:convert';

LaureatesResponse laureatesResponseFromJson(String str) => LaureatesResponse.fromJson(json.decode(str));

String laureatesResponseToJson(LaureatesResponse data) => json.encode(data.toJson());

class LaureatesResponse {
    LaureatesResponse({
        this.laureates,
        this.meta,
        this.links,
    });

    List<Laureate> laureates;
    Meta meta;
    LaureatesResponseLinks links;

    factory LaureatesResponse.fromJson(Map<String, dynamic> json) => LaureatesResponse(
        laureates: List<Laureate>.from(json["laureates"].map((x) => Laureate.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
        links: LaureatesResponseLinks.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "laureates": List<dynamic>.from(laureates.map((x) => x.toJson())),
        "meta": meta.toJson(),
        "links": links.toJson(),
    };
}

class Laureate {
    Laureate({
        this.id,
        this.knownName,
        this.givenName,
        this.familyName,
        this.fullName,
        this.gender,
        this.birth,
        this.links,
        this.nobelPrizes,
        this.death,
    });

    String id;
    Name knownName;
    Name givenName;
    Name familyName;
    Name fullName;
    Gender gender;
    Birth birth;
    LaureateLinks links;
    List<NobelPrize> nobelPrizes;
    Death death;

    factory Laureate.fromJson(Map<String, dynamic> json) => Laureate(
        id: json["id"],
        knownName: Name.fromJson(json["knownName"]),
        givenName: Name.fromJson(json["givenName"]),
        familyName: Name.fromJson(json["familyName"]),
        fullName: Name.fromJson(json["fullName"]),
        gender: genderValues.map[json["gender"]],
        birth: Birth.fromJson(json["birth"]),
        links: LaureateLinks.fromJson(json["links"]),
        nobelPrizes: List<NobelPrize>.from(json["nobelPrizes"].map((x) => NobelPrize.fromJson(x))),
        death: json["death"] == null ? null : Death.fromJson(json["death"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "knownName": knownName.toJson(),
        "givenName": givenName.toJson(),
        "familyName": familyName.toJson(),
        "fullName": fullName.toJson(),
        "gender": genderValues.reverse[gender],
        "birth": birth.toJson(),
        "links": links.toJson(),
        "nobelPrizes": List<dynamic>.from(nobelPrizes.map((x) => x.toJson())),
        "death": death == null ? null : death.toJson(),
    };
}

class Birth {
    Birth({
        this.date,
        this.place,
    });

    String date;
    Place place;

    factory Birth.fromJson(Map<String, dynamic> json) => Birth(
        date: json["date"],
        place: Place.fromJson(json["place"]),
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "place": place.toJson(),
    };
}

class Place {
    Place({
        this.city,
        this.country,
        this.cityNow,
        this.countryNow,
        this.continent,
        this.locationString,
    });

    LocationString city;
    LocationString country;
    LocationString cityNow;
    LocationString countryNow;
    Continent continent;
    LocationString locationString;

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        city: json["city"] == null ? null : LocationString.fromJson(json["city"]),
        country: json["country"] == null ? null : LocationString.fromJson(json["country"]),
        cityNow: json["cityNow"] == null ? null : LocationString.fromJson(json["cityNow"]),
        countryNow: json["countryNow"] == null ? null : LocationString.fromJson(json["countryNow"]),
        continent: json["continent"] == null ? null : Continent.fromJson(json["continent"]),
        locationString: LocationString.fromJson(json["locationString"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city == null ? null : city.toJson(),
        "country": country == null ? null : country.toJson(),
        "cityNow": cityNow == null ? null : cityNow.toJson(),
        "countryNow": countryNow == null ? null : countryNow.toJson(),
        "continent": continent == null ? null : continent.toJson(),
        "locationString": locationString.toJson(),
    };
}

class LocationString {
    LocationString({
        this.en,
        this.no,
        this.se,
    });

    String en;
    String no;
    String se;

    factory LocationString.fromJson(Map<String, dynamic> json) => LocationString(
        en: json["en"],
        no: json["no"] == null ? null : json["no"],
        se: json["se"] == null ? null : json["se"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "no": no == null ? null : no,
        "se": se == null ? null : se,
    };
}

class Continent {
    Continent({
        this.en,
    });

    String en;

    factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
    };
}

class Death {
    Death({
        this.date,
        this.place,
    });

    DateTime date;
    Place place;

    factory Death.fromJson(Map<String, dynamic> json) => Death(
        date: DateTime.parse(json["date"]),
        place: Place.fromJson(json["place"]),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "place": place.toJson(),
    };
}

class Name {
    Name({
        this.en,
        this.se,
    });

    String en;
    String se;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        en: json["en"],
        se: json["se"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "se": se,
    };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE
});

class LaureateLinks {
    LaureateLinks({
        this.rel,
        this.href,
        this.action,
        this.types,
    });

    Rel rel;
    String href;
    Action action;
    Types types;

    factory LaureateLinks.fromJson(Map<String, dynamic> json) => LaureateLinks(
        rel: relValues.map[json["rel"]],
        href: json["href"],
        action: actionValues.map[json["action"]],
        types: typesValues.map[json["types"]],
    );

    Map<String, dynamic> toJson() => {
        "rel": relValues.reverse[rel],
        "href": href,
        "action": actionValues.reverse[action],
        "types": typesValues.reverse[types],
    };
}

enum Action { GET }

final actionValues = EnumValues({
    "Get": Action.GET
});

enum Rel { LAUREATE, NOBEL_PRIZE }

final relValues = EnumValues({
    "laureate": Rel.LAUREATE,
    "nobelPrize": Rel.NOBEL_PRIZE
});

enum Types { APPLICATION_JSON }

final typesValues = EnumValues({
    "application/json": Types.APPLICATION_JSON
});

class NobelPrize {
    NobelPrize({
        this.awardYear,
        this.category,
        this.categoryFullName,
        this.sortOrder,
        this.portion,
        this.dateAwarded,
        this.prizeStatus,
        this.motivation,
        this.prizeAmount,
        this.prizeAmountAdjusted,
        this.affiliations,
        this.links,
        this.residences,
    });

    String awardYear;
    LocationString category;
    LocationString categoryFullName;
    String sortOrder;
    String portion;
    DateTime dateAwarded;
    PrizeStatus prizeStatus;
    LocationString motivation;
    int prizeAmount;
    int prizeAmountAdjusted;
    List<Affiliation> affiliations;
    LaureateLinks links;
    List<Residence> residences;

    factory NobelPrize.fromJson(Map<String, dynamic> json) => NobelPrize(
        awardYear: json["awardYear"],
        category: LocationString.fromJson(json["category"]),
        categoryFullName: LocationString.fromJson(json["categoryFullName"]),
        sortOrder: json["sortOrder"],
        portion: json["portion"],
        dateAwarded: json["dateAwarded"] == null ? null : DateTime.parse(json["dateAwarded"]),
        prizeStatus: prizeStatusValues.map[json["prizeStatus"]],
        motivation: LocationString.fromJson(json["motivation"]),
        prizeAmount: json["prizeAmount"],
        prizeAmountAdjusted: json["prizeAmountAdjusted"],
        affiliations: json["affiliations"] == null ? null : List<Affiliation>.from(json["affiliations"].map((x) => Affiliation.fromJson(x))),
        links: LaureateLinks.fromJson(json["links"]),
        residences: json["residences"] == null ? null : List<Residence>.from(json["residences"].map((x) => Residence.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "awardYear": awardYear,
        "category": category.toJson(),
        "categoryFullName": categoryFullName.toJson(),
        "sortOrder": sortOrder,
        "portion": portion,
        "dateAwarded": dateAwarded == null ? null : "${dateAwarded.year.toString().padLeft(4, '0')}-${dateAwarded.month.toString().padLeft(2, '0')}-${dateAwarded.day.toString().padLeft(2, '0')}",
        "prizeStatus": prizeStatusValues.reverse[prizeStatus],
        "motivation": motivation.toJson(),
        "prizeAmount": prizeAmount,
        "prizeAmountAdjusted": prizeAmountAdjusted,
        "affiliations": affiliations == null ? null : List<dynamic>.from(affiliations.map((x) => x.toJson())),
        "links": links.toJson(),
        "residences": residences == null ? null : List<dynamic>.from(residences.map((x) => x.toJson())),
    };
}

class Affiliation {
    Affiliation({
        this.name,
        this.nameNow,
        this.city,
        this.country,
        this.cityNow,
        this.countryNow,
        this.locationString,
    });

    LocationString name;
    Continent nameNow;
    LocationString city;
    LocationString country;
    LocationString cityNow;
    LocationString countryNow;
    LocationString locationString;

    factory Affiliation.fromJson(Map<String, dynamic> json) => Affiliation(
        name: LocationString.fromJson(json["name"]),
        nameNow: Continent.fromJson(json["nameNow"]),
        city: LocationString.fromJson(json["city"]),
        country: LocationString.fromJson(json["country"]),
        cityNow: LocationString.fromJson(json["cityNow"]),
        countryNow: LocationString.fromJson(json["countryNow"]),
        locationString: LocationString.fromJson(json["locationString"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "nameNow": nameNow.toJson(),
        "city": city.toJson(),
        "country": country.toJson(),
        "cityNow": cityNow.toJson(),
        "countryNow": countryNow.toJson(),
        "locationString": locationString.toJson(),
    };
}

enum PrizeStatus { RECEIVED }

final prizeStatusValues = EnumValues({
    "received": PrizeStatus.RECEIVED
});

class Residence {
    Residence({
        this.country,
        this.countryNow,
        this.locationString,
    });

    LocationString country;
    LocationString countryNow;
    LocationString locationString;

    factory Residence.fromJson(Map<String, dynamic> json) => Residence(
        country: LocationString.fromJson(json["country"]),
        countryNow: LocationString.fromJson(json["countryNow"]),
        locationString: LocationString.fromJson(json["locationString"]),
    );

    Map<String, dynamic> toJson() => {
        "country": country.toJson(),
        "countryNow": countryNow.toJson(),
        "locationString": locationString.toJson(),
    };
}

class LaureatesResponseLinks {
    LaureatesResponseLinks({
        this.first,
        this.self,
        this.next,
        this.prev,
        this.last,
    });

    String first;
    String self;
    String next;
    String prev;
    String last;

    factory LaureatesResponseLinks.fromJson(Map<String, dynamic> json) => LaureatesResponseLinks(
        first: json["first"],
        self: json["self"],
        next: json["next"],
        prev: json["prev"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "self": self,
        "next": next,
        "prev": prev,
        "last": last,
    };
}

class Meta {
    Meta({
        this.offset,
        this.limit,
        this.count,
    });

    int offset;
    int limit;
    int count;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        offset: json["offset"],
        limit: json["limit"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
