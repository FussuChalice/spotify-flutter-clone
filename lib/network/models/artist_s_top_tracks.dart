// To parse this JSON data, do
//
//     final artistSTopTracks = artistSTopTracksFromJson(jsonString);

import 'dart:convert';

ArtistSTopTracks artistSTopTracksFromJson(String str) => ArtistSTopTracks.fromJson(json.decode(str));

String artistSTopTracksToJson(ArtistSTopTracks data) => json.encode(data.toJson());

class ArtistSTopTracks {
    List<Track> tracks;

    ArtistSTopTracks({
        required this.tracks,
    });

    factory ArtistSTopTracks.fromJson(Map<String, dynamic> json) => ArtistSTopTracks(
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
    };
}

class Track {
    Album album;
    List<TrackArtist> artists;
    List<String> availableMarkets;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalIds externalIds;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isPlayable;
    LinkedFrom linkedFrom;
    Restrictions restrictions;
    String name;
    int popularity;
    String previewUrl;
    int trackNumber;
    String type;
    String uri;
    bool isLocal;

    Track({
        required this.album,
        required this.artists,
        required this.availableMarkets,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalIds,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isPlayable,
        required this.linkedFrom,
        required this.restrictions,
        required this.name,
        required this.popularity,
        required this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
        required this.isLocal,
    });

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: Album.fromJson(json["album"]),
        artists: List<TrackArtist>.from(json["artists"].map((x) => TrackArtist.fromJson(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: ExternalIds.fromJson(json["external_ids"]),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isPlayable: json["is_playable"],
        linkedFrom: LinkedFrom.fromJson(json["linked_from"]),
        restrictions: Restrictions.fromJson(json["restrictions"]),
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
        isLocal: json["is_local"],
    );

    Map<String, dynamic> toJson() => {
        "album": album.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_playable": isPlayable,
        "linked_from": linkedFrom.toJson(),
        "restrictions": restrictions.toJson(),
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
        "is_local": isLocal,
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
    List<AlbumArtist> artists;

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
        artists: List<AlbumArtist>.from(json["artists"].map((x) => AlbumArtist.fromJson(x))),
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
    };
}

class AlbumArtist {
    ExternalUrls externalUrls;
    String href;
    String id;
    String name;
    String type;
    String uri;

    AlbumArtist({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.type,
        required this.uri,
    });

    factory AlbumArtist.fromJson(Map<String, dynamic> json) => AlbumArtist(
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

class TrackArtist {
    ExternalUrls externalUrls;
    Followers followers;
    List<String> genres;
    String href;
    String id;
    List<Image> images;
    String name;
    int popularity;
    String type;
    String uri;

    TrackArtist({
        required this.externalUrls,
        required this.followers,
        required this.genres,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.popularity,
        required this.type,
        required this.uri,
    });

    factory TrackArtist.fromJson(Map<String, dynamic> json) => TrackArtist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "followers": followers.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
    };
}

class Followers {
    String href;
    int total;

    Followers({
        required this.href,
        required this.total,
    });

    factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
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

class LinkedFrom {
    LinkedFrom();

    factory LinkedFrom.fromJson(Map<String, dynamic> json) => LinkedFrom(
    );

    Map<String, dynamic> toJson() => {
    };
}
