import 'package:best_architecture_challenge/post_model.dart';
import 'package:best_architecture_challenge/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;
enum SortState { sortWithId, sortWithTitle, sortWithBody, sortWithUserId }

class PostProvider extends ChangeNotifier {
  PostRepository _postRepository = PostRepository();

  SortState _sortState = SortState.sortWithId;

  SortState get sortState => _sortState;

  List<MessageJson> _posts = [];

  List<MessageJson> get posts => _posts;

  fetchData(SortState sortState) async {
    _sortState = sortState;
    _posts = await _postRepository.fetchData();
    if (_sortState == SortState.sortWithId) {
      _posts = [..._posts];
      _posts.sort((a, b) => a.id.compareTo(b.id));
    } else if (_sortState == SortState.sortWithTitle) {
      _posts = [..._posts];
      _posts.sort((a, b) => a.title.compareTo(b.title));
    } else if (_sortState == SortState.sortWithBody) {
      _posts = [..._posts];
      _posts.sort((a, b) => a.body.compareTo(b.body));
    } else if (_sortState == SortState.sortWithUserId) {
      _posts = [..._posts];
      _posts.sort((a, b) => a.userId.compareTo(b.userId));
    }
    notifyListeners();
  }
}
