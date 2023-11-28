// To parse this JSON data, do
//
//     final userSavedAlbum = userSavedAlbumFromJson(jsonString);

import 'dart:convert';

UserSavedAlbum userSavedAlbumFromJson(String str) => UserSavedAlbum.fromJson(json.decode(str));

String userSavedAlbumToJson(UserSavedAlbum data) => json.encode(data.toJson());

class UserSavedAlbum {
    String href;
    int limit;
    String next;
    int offset;
    String previous;
    int total;
    List<UserSavedAlbumItem> items;

    UserSavedAlbum({
        required this.href,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
        required this.items,
    });

    factory UserSavedAlbum.fromJson(Map<String, dynamic> json) => UserSavedAlbum(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: List<UserSavedAlbumItem>.from(json["items"].map((x) => UserSavedAlbumItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class UserSavedAlbumItem {
    String addedAt;
    Album album;

    UserSavedAlbumItem({
        required this.addedAt,
        required this.album,
    });

    factory UserSavedAlbumItem.fromJson(Map<String, dynamic> json) => UserSavedAlbumItem(
        addedAt: json["added_at"],
        album: Album.fromJson(json["album"]),
    );

    Map<String, dynamic> toJson() => {
        "added_at": addedAt,
        "album": album.toJson(),
    };
}

class Album {
    String albumType;
    int totalTracks;
    List<String> availableMarkets;
    ExternalUrls externalUrls;
    String href;
    String id;
    List<Image> images;
    String name;
    String releaseDate;
    String releaseDatePrecision;
    Restrictions restrictions;
    String type;
    String uri;
    List<Artist> artists;
    Tracks tracks;
    List<Copyright> copyrights;
    ExternalIds externalIds;
    List<String> genres;
    String label;
    int popularity;

    Album({
        required this.albumType,
        required this.totalTracks,
        required this.availableMarkets,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.restrictions,
        required this.type,
        required this.uri,
        required this.artists,
        required this.tracks,
        required this.copyrights,
        required this.externalIds,
        required this.genres,
        required this.label,
        required this.popularity,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        totalTracks: json["total_tracks"],
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        restrictions: Restrictions.fromJson(json["restrictions"]),
        type: json["type"],
        uri: json["uri"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        tracks: Tracks.fromJson(json["tracks"]),
        copyrights: List<Copyright>.from(json["copyrights"].map((x) => Copyright.fromJson(x))),
        externalIds: ExternalIds.fromJson(json["external_ids"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        label: json["label"],
        popularity: json["popularity"],
    );

    Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "total_tracks": totalTracks,
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "restrictions": restrictions.toJson(),
        "type": type,
        "uri": uri,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "tracks": tracks.toJson(),
        "copyrights": List<dynamic>.from(copyrights.map((x) => x.toJson())),
        "external_ids": externalIds.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "label": label,
        "popularity": popularity,
    };
}

class Artist {
    ExternalUrls externalUrls;
    String href;
    String id;
    String? name;
    String type;
    String uri;

    Artist({
        required this.externalUrls,
        required this.href,
        required this.id,
        this.name,
        required this.type,
        required this.uri,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
    };
}

class ExternalUrls {
    String spotify;

    ExternalUrls({
        required this.spotify,
    });

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

class Copyright {
    String text;
    String type;

    Copyright({
        required this.text,
        required this.type,
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

class ExternalIds {
    String isrc;
    String ean;
    String upc;

    ExternalIds({
        required this.isrc,
        required this.ean,
        required this.upc,
    });

    factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
        ean: json["ean"],
        upc: json["upc"],
    );

    Map<String, dynamic> toJson() => {
        "isrc": isrc,
        "ean": ean,
        "upc": upc,
    };
}

class Image {
    String url;
    int height;
    int width;

    Image({
        required this.url,
        required this.height,
        required this.width,
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
    String reason;

    Restrictions({
        required this.reason,
    });

    factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "reason": reason,
    };
}

class Tracks {
    String href;
    int limit;
    String next;
    int offset;
    String previous;
    int total;
    List<TracksItem> items;

    Tracks({
        required this.href,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
        required this.items,
    });

    factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: List<TracksItem>.from(json["items"].map((x) => TracksItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class TracksItem {
    List<Artist> artists;
    List<String> availableMarkets;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isPlayable;
    Artist linkedFrom;
    Restrictions restrictions;
    String name;
    String previewUrl;
    int trackNumber;
    String type;
    String uri;
    bool isLocal;

    TracksItem({
        required this.artists,
        required this.availableMarkets,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isPlayable,
        required this.linkedFrom,
        required this.restrictions,
        required this.name,
        required this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
        required this.isLocal,
    });

    factory TracksItem.fromJson(Map<String, dynamic> json) => TracksItem(
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isPlayable: json["is_playable"],
        linkedFrom: Artist.fromJson(json["linked_from"]),
        restrictions: Restrictions.fromJson(json["restrictions"]),
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
        isLocal: json["is_local"],
    );

    Map<String, dynamic> toJson() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_playable": isPlayable,
        "linked_from": linkedFrom.toJson(),
        "restrictions": restrictions.toJson(),
        "name": name,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
        "is_local": isLocal,
    };
}
