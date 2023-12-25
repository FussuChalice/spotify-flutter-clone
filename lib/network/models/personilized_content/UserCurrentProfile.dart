// To parse this JSON data, do
//
//     final userCurrentProfile = userCurrentProfileFromJson(jsonString);

import 'dart:convert';

UserCurrentProfile userCurrentProfileFromJson(String str) => UserCurrentProfile.fromJson(json.decode(str));

String userCurrentProfileToJson(UserCurrentProfile data) => json.encode(data.toJson());

class UserCurrentProfile {
    String? country;
    String? displayName;
    String? email;
    ExplicitContent? explicitContent;
    ExternalUrls? externalUrls;
    Followers? followers;
    String? href;
    String? id;
    List<Image>? images;
    String? product;
    String? type;
    String? uri;

    UserCurrentProfile({
        this.country,
        this.displayName,
        this.email,
        this.explicitContent,
        this.externalUrls,
        this.followers,
        this.href,
        this.id,
        this.images,
        this.product,
        this.type,
        this.uri,
    });

    factory UserCurrentProfile.fromJson(Map<String, dynamic> json) => UserCurrentProfile(
        country: json["country"],
        displayName: json["display_name"],
        email: json["email"],
        explicitContent: json["explicit_content"] == null ? null : ExplicitContent.fromJson(json["explicit_content"]),
        externalUrls: json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null ? null : Followers.fromJson(json["followers"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        product: json["product"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "display_name": displayName,
        "email": email,
        "explicit_content": explicitContent?.toJson(),
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "href": href,
        "id": id,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "product": product,
        "type": type,
        "uri": uri,
    };
}

class ExplicitContent {
    bool? filterEnabled;
    bool? filterLocked;

    ExplicitContent({
        this.filterEnabled,
        this.filterLocked,
    });

    factory ExplicitContent.fromJson(Map<String, dynamic> json) => ExplicitContent(
        filterEnabled: json["filter_enabled"],
        filterLocked: json["filter_locked"],
    );

    Map<String, dynamic> toJson() => {
        "filter_enabled": filterEnabled,
        "filter_locked": filterLocked,
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

class Followers {
    String? href;
    int? total;

    Followers({
        this.href,
        this.total,
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
