// To parse this JSON data, do
//
//     final show = showFromJson(jsonString);

import 'dart:convert';

Show showFromJson(String str) => Show.fromJson(json.decode(str));

String showToJson(Show data) => json.encode(data.toJson());

class Show {
    List<String>? availableMarkets;
    List<Copyright>? copyrights;
    String? description;
    String? htmlDescription;
    bool? explicit;
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    List<Image>? images;
    bool? isExternallyHosted;
    List<String>? languages;
    String? mediaType;
    String? name;
    String? publisher;
    String? type;
    String? uri;
    int? totalEpisodes;
    Episodes? episodes;

    Show({
        this.availableMarkets,
        this.copyrights,
        this.description,
        this.htmlDescription,
        this.explicit,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.isExternallyHosted,
        this.languages,
        this.mediaType,
        this.name,
        this.publisher,
        this.type,
        this.uri,
        this.totalEpisodes,
        this.episodes,
    });

    factory Show.fromJson(Map<String, dynamic> json) => Show(
        availableMarkets: json["available_markets"] == null ? [] : List<String>.from(json["available_markets"]!.map((x) => x)),
        copyrights: json["copyrights"] == null ? [] : List<Copyright>.from(json["copyrights"]!.map((x) => Copyright.fromJson(x))),
        description: json["description"],
        htmlDescription: json["html_description"],
        explicit: json["explicit"],
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        isExternallyHosted: json["is_externally_hosted"],
        languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
        mediaType: json["media_type"],
        name: json["name"],
        publisher: json["publisher"],
        type: json["type"],
        uri: json["uri"],
        totalEpisodes: json["total_episodes"],
        episodes: json["episodes"] == null ? null : Episodes.fromJson(json["episodes"]),
    );

    Map<String, dynamic> toJson() => {
        "available_markets": availableMarkets == null ? [] : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "copyrights": copyrights == null ? [] : List<dynamic>.from(copyrights!.map((x) => x.toJson())),
        "description": description,
        "html_description": htmlDescription,
        "explicit": explicit,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "is_externally_hosted": isExternallyHosted,
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
        "media_type": mediaType,
        "name": name,
        "publisher": publisher,
        "type": type,
        "uri": uri,
        "total_episodes": totalEpisodes,
        "episodes": episodes?.toJson(),
    };
}

class Copyright {
    String? text;
    String? type;

    Copyright({
        this.text,
        this.type,
    });

    factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        text: json["text"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
    };
}

class Episodes {
    String? href;
    int? limit;
    String? next;
    int? offset;
    String? previous;
    int? total;
    List<Item>? items;

    Episodes({
        this.href,
        this.limit,
        this.next,
        this.offset,
        this.previous,
        this.total,
        this.items,
    });

    factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    String? audioPreviewUrl;
    String? description;
    String? htmlDescription;
    int? durationMs;
    bool? explicit;
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    List<Image>? images;
    bool? isExternallyHosted;
    bool? isPlayable;
    String? language;
    List<String>? languages;
    String? name;
    DateTime? releaseDate;
    String? releaseDatePrecision;
    ResumePoint? resumePoint;
    String? type;
    String? uri;
    Restrictions? restrictions;

    Item({
        this.audioPreviewUrl,
        this.description,
        this.htmlDescription,
        this.durationMs,
        this.explicit,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.isExternallyHosted,
        this.isPlayable,
        this.language,
        this.languages,
        this.name,
        this.releaseDate,
        this.releaseDatePrecision,
        this.resumePoint,
        this.type,
        this.uri,
        this.restrictions,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        audioPreviewUrl: json["audio_preview_url"],
        description: json["description"],
        htmlDescription: json["html_description"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        isExternallyHosted: json["is_externally_hosted"],
        isPlayable: json["is_playable"],
        language: json["language"],
        languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
        name: json["name"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        resumePoint: json["resume_point"] == null ? null : ResumePoint.fromJson(json["resume_point"]),
        type: json["type"],
        uri: json["uri"],
        restrictions: json["restrictions"] == null ? null : Restrictions.fromJson(json["restrictions"]),
    );

    Map<String, dynamic> toJson() => {
        "audio_preview_url": audioPreviewUrl,
        "description": description,
        "html_description": htmlDescription,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "is_externally_hosted": isExternallyHosted,
        "is_playable": isPlayable,
        "language": language,
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
        "name": name,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "resume_point": resumePoint?.toJson(),
        "type": type,
        "uri": uri,
        "restrictions": restrictions?.toJson(),
    };
}

class ExternalUrls {
    String? spotify;

    ExternalUrls({
        this.spotify,
    });

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

class Image {
    String? url;
    int? height;
    int? width;

    Image({
        this.url,
        this.height,
        this.width,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        height: json["height"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "height": height,
        "width": width,
    };
}

class Restrictions {
    String? reason;

    Restrictions({
        this.reason,
    });

    factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
    };
}

class ResumePoint {
    bool? fullyPlayed;
    int? resumePositionMs;

    ResumePoint({
        this.fullyPlayed,
        this.resumePositionMs,
    });

    factory ResumePoint.fromJson(Map<String, dynamic> json) => ResumePoint(
        fullyPlayed: json["fully_played"],
        resumePositionMs: json["resume_position_ms"],
    );

    Map<String, dynamic> toJson() => {
        "fully_played": fullyPlayed,
        "resume_position_ms": resumePositionMs,
    };
}
