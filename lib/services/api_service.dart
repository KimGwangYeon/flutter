import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final responce = await http.get(url);

    if (responce.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(responce.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}

  // url에 요청을 보내기 위해서는 http 패키지가 필요하다
  // 공식 패키지 보관소 pub.dev에 잘 나와있다(npm for Node.js and PyPl for Python)
  // 설치는 커맨드라인에 dart pub add http
  // 아니면 pubspec.yaml에 package와 버전넣고 저장하면 다운로드시작한다.
  //get이란 명령어는 너무 general해서 import package에 alias를 부여해서 쓴다.
  // 서버에 api요청을 보내는 일은 여러 이유료 시간이 좀 소요될 수도 있는 일이다.
  // 요청이 처리된 이후에 코드가 실행되어야 한다
  // 특정 상황(side effect: api요청에 대한 응답)까지 기다린 후 이어서 코드진행
  // = 비동기(async programing)
  // 명령어 앞에 await을 붙여서 지시할 수 있는데, asynchronous function에만 가능하다(함수 선언 시에 async라고 붙여서 지정할 수 있다)
  // 보통 반환타입 future와 사용할 때가 많다 Future<Response>: 미래에 responce type을 반환받는 것