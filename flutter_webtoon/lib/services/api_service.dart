import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_detail_model.dart';
import 'package:flutter_webtoon/models/webtoon_episode_model.dart';
import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";

  // 오늘의 웹툰 리스트를 가져오는 API
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse(baseURL + today);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }

      return webtoonInstances;
    } else {
      throw Error();
    }
  }

  // 웹툰의 상세 정보를 가져오는 API
  static Future<WebtoonDetailModel> getWebtoonDetailById(String id) async {
    final url = Uri.parse(baseURL + id);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);

      final webtoonDetailInstance = WebtoonDetailModel.fromJson(webtoon);

      return webtoonDetailInstance;
    } else {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>> getLastedEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];

    final url = Uri.parse("$baseURL$id/episodes");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);

      for (var episode in episodes) {
        final instance = WebtoonEpisodeModel.fromJson(episode);
        episodesInstances.add(instance);
      }

      return episodesInstances;
    } else {
      throw Error();
    }
  }
}
