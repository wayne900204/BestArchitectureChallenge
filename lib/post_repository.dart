import 'package:best_architecture_challenge/post_model.dart';
import 'package:best_architecture_challenge/post_service.dart';

class PostRepository{
  PostService _postService = PostService();
  Future<List<MessageJson>> fetchData() async {
    return _postService.fetchData();
  }
}
