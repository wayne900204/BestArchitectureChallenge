import 'package:best_architecture_challenge/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
class PostService {
  Future<List<MessageJson>> fetchData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return messageJsonFromJson(response.body);
    } else {
      developer.log("FetchData StatusCode：",error: response.statusCode);
      throw Exception();
    }
  }
}
