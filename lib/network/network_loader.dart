import 'package:http/http.dart' as http;

import './models/artist_s_top_tracks.dart' as artist_s_top_tracks;
import './models/album.dart' as album;
import './models/artist.dart' as artist;
import './models/show.dart' as show;

/// A class for making network requests to the Spotify Web API to fetch various types of data.
class NetworkLoader {
  final Map<String, String> requestHeaders;

  /// Constructs a NetworkLoader instance with the provided HTTP request headers.
  ///
  /// [requestHeaders] - The headers to be included in the HTTP requests to the Spotify Web API.
  NetworkLoader(this.requestHeaders);


  /// Fetches an artist's top tracks.
  ///
  /// This method retrieves a list of an artist's top tracks as specified in the Spotify Web API documentation.
  ///
  /// [id] - The unique identifier of the artist whose top tracks you want to fetch.
  /// Returns an instance of [artist_s_top_tracks.ArtistSTopTracks] if the request is successful.
  /// Throws an exception with an error message if the request fails.
  Future<artist_s_top_tracks.ArtistSTopTracks> fetchArtistSTopTracks(String id) async {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/artists/$id/top-tracks'),
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return artist_s_top_tracks.artistSTopTracksFromJson(response.body);
    } else {
      throw Exception('Failed to load artist_s_top_tracks');
    }
  }

  /// Fetches details of a specific album.
  ///
  /// This method retrieves detailed information about a specific album using its unique identifier.
  ///
  /// [id] - The unique identifier of the album you want to fetch.
  /// Returns an instance of [album.Album] if the request is successful.
  /// Throws an exception with an error message if the response body is empty.
  Future<album.Album> fetchAlbum(String id) async {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/albums/$id'),
      headers: requestHeaders,
    );

    if (response.body.isNotEmpty) {
      return album.albumFromJson(response.body);

    } else {
      throw Exception('Response body is empty.');
    }
  }

  /// Fetches details of a specific artist.
  ///
  /// This method retrieves detailed information about a specific artist using their unique identifier.
  ///
  /// [id] - The unique identifier of the artist you want to fetch.
  /// Returns an instance of [artist.Artist] if the request is successful.
  /// Throws an exception with an error message if the request fails.
  Future<artist.Artist> fetchArtist(String id) async {

    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/artists/$id'),
      headers: requestHeaders
    );

    if (response.statusCode == 200) {
      return artist.artistFromJson(response.body);
    } else {
      throw Exception('Failed to load artist');
    }
  }

  /// Fetches details of a specific show.
  ///
  /// This method retrieves detailed information about a specific show using its unique identifier.
  ///
  /// [id] - The unique identifier of the show you want to fetch.
  /// Returns an instance of [show.Show] if the request is successful.
  /// Throws an exception with an error message if the request fails.
  Future<show.Show> fetchShow(String id) async {

    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/shows/$id'),
      headers: requestHeaders
    );

    if (response.statusCode == 200) {
      return show.showFromJson(response.body);
    } else {
      throw Exception('Failed to load show');
    }
  }
}