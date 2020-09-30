// To parse this JSON data, do
//
//     final nobelPrizeResponse = nobelPrizeResponseFromJson(jsonString);

import 'dart:convert';

NobelPrizeResponse nobelPrizeResponseFromJson(String str) =>
    NobelPrizeResponse.fromJson(json.decode(str));

String nobelPrizeResponseToJson(NobelPrizeResponse data) =>
    json.encode(data.toJson());

class NobelPrizeResponse {
  NobelPrizeResponse({
    this.nobelPrizes,
    this.meta,
    this.links,
  });

  List<NobelPrize> nobelPrizes;
  Meta meta;
  NobelPrizeResponseLinks links;

  factory NobelPrizeResponse.fromJson(Map<String, dynamic> json) =>
      NobelPrizeResponse(
        nobelPrizes: json["nobelPrizes"] == null
            ? null
            : List<NobelPrize>.from(
                json["nobelPrizes"].map((x) => NobelPrize.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        links: json["links"] == null
            ? null
            : NobelPrizeResponseLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "nobelPrizes": nobelPrizes == null
            ? null
            : List<dynamic>.from(nobelPrizes.map((x) => x.toJson())),
        "meta": meta == null ? null : meta.toJson(),
        "links": links == null ? null : links.toJson(),
      };
}

class NobelPrizeResponseLinks {
  NobelPrizeResponseLinks({
    this.first,
    this.prev,
    this.self,
    this.next,
    this.last,
  });

  String first;
  String prev;
  String self;
  String next;
  String last;

  factory NobelPrizeResponseLinks.fromJson(Map<String, dynamic> json) =>
      NobelPrizeResponseLinks(
        first: json["first"] == null ? null : json["first"],
        prev: json["prev"] == null ? null : json["prev"],
        self: json["self"] == null ? null : json["self"],
        next: json["next"] == null ? null : json["next"],
        last: json["last"] == null ? null : json["last"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "prev": prev == null ? null : prev,
        "self": self == null ? null : self,
        "next": next == null ? null : next,
        "last": last == null ? null : last,
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
        offset: json["offset"] == null ? null : json["offset"],
        limit: json["limit"] == null ? null : json["limit"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset == null ? null : offset,
        "limit": limit == null ? null : limit,
        "count": count == null ? null : count,
      };
}

class NobelPrize {
  NobelPrize({
    this.awardYear,
    this.category,
    this.categoryFullName,
    this.dateAwarded,
    this.prizeAmount,
    this.prizeAmountAdjusted,
    this.links,
    this.laureates,
    this.topMotivation,
  });

  String awardYear;
  Category category;
  Category categoryFullName;
  DateTime dateAwarded;
  int prizeAmount;
  int prizeAmountAdjusted;
  LaureateLinks links;
  List<Laureate> laureates;
  TopMotivation topMotivation;

  factory NobelPrize.fromJson(Map<String, dynamic> json) => NobelPrize(
        awardYear: json["awardYear"] == null ? null : json["awardYear"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        categoryFullName: json["categoryFullName"] == null
            ? null
            : Category.fromJson(json["categoryFullName"]),
        dateAwarded: json["dateAwarded"] == null
            ? null
            : DateTime.parse(json["dateAwarded"]),
        prizeAmount: json["prizeAmount"] == null ? null : json["prizeAmount"],
        prizeAmountAdjusted: json["prizeAmountAdjusted"] == null
            ? null
            : json["prizeAmountAdjusted"],
        links: json["links"] == null
            ? null
            : LaureateLinks.fromJson(json["links"]),
        laureates: json["laureates"] == null
            ? null
            : List<Laureate>.from(
                json["laureates"].map((x) => Laureate.fromJson(x))),
        topMotivation: json["topMotivation"] == null
            ? null
            : TopMotivation.fromJson(json["topMotivation"]),
      );

  Map<String, dynamic> toJson() => {
        "awardYear": awardYear == null ? null : awardYear,
        "category": category == null ? null : category.toJson(),
        "categoryFullName":
            categoryFullName == null ? null : categoryFullName.toJson(),
        "dateAwarded": dateAwarded == null
            ? null
            : "${dateAwarded.year.toString().padLeft(4, '0')}-${dateAwarded.month.toString().padLeft(2, '0')}-${dateAwarded.day.toString().padLeft(2, '0')}",
        "prizeAmount": prizeAmount == null ? null : prizeAmount,
        "prizeAmountAdjusted":
            prizeAmountAdjusted == null ? null : prizeAmountAdjusted,
        "links": links == null ? null : links.toJson(),
        "laureates": laureates == null
            ? null
            : List<dynamic>.from(laureates.map((x) => x.toJson())),
        "topMotivation": topMotivation == null ? null : topMotivation.toJson(),
      };
}

class Category {
  Category({
    this.en,
    this.no,
    this.se,
  });

  String en;
  String no;
  String se;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        en: json["en"] == null ? null : json["en"],
        no: json["no"] == null ? null : json["no"],
        se: json["se"] == null ? null : json["se"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "no": no == null ? null : no,
        "se": se == null ? null : se,
      };
}

class Laureate {
  Laureate({
    this.id,
    this.knownName,
    this.portion,
    this.sortOrder,
    this.motivation,
    this.links,
    this.orgName,
  });

  String id;
  KnownName knownName;
  String portion;
  String sortOrder;
  Category motivation;
  LaureateLinks links;
  OrgName orgName;

  factory Laureate.fromJson(Map<String, dynamic> json) => Laureate(
        id: json["id"] == null ? null : json["id"],
        knownName: json["knownName"] == null
            ? null
            : KnownName.fromJson(json["knownName"]),
        portion: json["portion"] == null ? null : json["portion"],
        sortOrder: json["sortOrder"] == null ? null : json["sortOrder"],
        motivation: json["motivation"] == null
            ? null
            : Category.fromJson(json["motivation"]),
        links: json["links"] == null
            ? null
            : LaureateLinks.fromJson(json["links"]),
        orgName:
            json["orgName"] == null ? null : OrgName.fromJson(json["orgName"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "knownName": knownName == null ? null : knownName.toJson(),
        "portion": portion == null ? null : portion,
        "sortOrder": sortOrder == null ? null : sortOrder,
        "motivation": motivation == null ? null : motivation.toJson(),
        "links": links == null ? null : links.toJson(),
        "orgName": orgName == null ? null : orgName.toJson(),
      };
}

class KnownName {
  KnownName({
    this.en,
  });

  String en;

  factory KnownName.fromJson(Map<String, dynamic> json) => KnownName(
        en: json["en"] == null ? null : json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
      };
}

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
        rel: json["rel"] == null ? null : relValues.map[json["rel"]],
        href: json["href"] == null ? null : json["href"],
        action:
            json["action"] == null ? null : actionValues.map[json["action"]],
        types: json["types"] == null ? null : typesValues.map[json["types"]],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel == null ? null : relValues.reverse[rel],
        "href": href == null ? null : href,
        "action": action == null ? null : actionValues.reverse[action],
        "types": types == null ? null : typesValues.reverse[types],
      };
}

enum Action { GET }

final actionValues = EnumValues({"Get": Action.GET});

enum Rel { LAUREATE, NOBEL_PRIZE }

final relValues =
    EnumValues({"laureate": Rel.LAUREATE, "nobelPrize": Rel.NOBEL_PRIZE});

enum Types { APPLICATION_JSON }

final typesValues = EnumValues({"application/json": Types.APPLICATION_JSON});

class OrgName {
  OrgName({
    this.en,
    this.no,
  });

  String en;
  String no;

  factory OrgName.fromJson(Map<String, dynamic> json) => OrgName(
        en: json["en"] == null ? null : json["en"],
        no: json["no"] == null ? null : json["no"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "no": no == null ? null : no,
      };
}

class TopMotivation {
  TopMotivation({
    this.en,
    this.se,
  });

  String en;
  String se;

  factory TopMotivation.fromJson(Map<String, dynamic> json) => TopMotivation(
        en: json["en"] == null ? null : json["en"],
        se: json["se"] == null ? null : json["se"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "se": se == null ? null : se,
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
