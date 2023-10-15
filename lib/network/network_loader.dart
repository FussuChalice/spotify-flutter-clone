import 'package:http/http.dart' as http;

import './models/artist_s_top_tracks.dart' as artist_s_top_tracks;
import './models/album.dart' as album;
import './models/artist.dart' as artist;
import './models/show.dart' as show;

class NetworkLoader {
  final Map<String, String> requestHeaders;

  NetworkLoader(this.requestHeaders);


  // Instruction: https://developer.spotify.com/documentation/web-api/reference/get-an-artists-top-tracks
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

  // Instruction: https://developer.spotify.com/documentation/web-api/reference/get-an-album
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

  // Instruction: https://developer.spotify.com/documentation/web-api/reference/get-an-artist
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

  // Instruction: https://developer.spotify.com/documentation/web-api/reference/get-an-artist
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