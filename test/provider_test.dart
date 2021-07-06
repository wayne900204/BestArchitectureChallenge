import 'package:best_architecture_challenge/post_model.dart';
import 'package:best_architecture_challenge/post_provider.dart';
import 'package:best_architecture_challenge/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'provider_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  group('Testing Post Provider', () {
    // Arrange
    var repository = MockPostRepository();
    var provider = PostProvider();
    test('sortState should be sortWithTitle', () {
      // Arrange
      when(repository.fetchData()).thenAnswer((realInvocation) => new Future(() => []));
      // Act
      provider.fetchData(SortState.sortWithTitle);
      // Assert
      expect(provider.sortState, SortState.sortWithTitle);
    });
    test('sortState should be sortWithBody', () {
      // Arrange
      when(repository.fetchData()).thenAnswer((realInvocation) => new Future(() => []));
      // Act
      provider.fetchData(SortState.sortWithBody);
      // Assert
      expect(provider.sortState, SortState.sortWithBody);
    });
    test('sortState should be sortWithId', () {
      // Arrange
      when(repository.fetchData()).thenAnswer((realInvocation) => new Future(() => []));
      // Act
      provider.fetchData(SortState.sortWithId);
      // Assert
      expect(provider.sortState, SortState.sortWithId);
    });
    test('sortState should be sortWithUserId', () {
      // Arrange
      when(repository.fetchData()).thenAnswer((realInvocation) => new Future(() => []));
      // Act
      provider.fetchData(SortState.sortWithUserId);
      // Assert
      expect(provider.sortState, SortState.sortWithUserId);
    });
  });

  group('Testing Post Api', () {
    // Arrange
    var provider = PostProvider();
    test('posts parameter should be List<MessageJson>', () {
      // Act
      provider.fetchData(SortState.sortWithId);
      // Assert
      expect(provider.posts, isA<List<MessageJson>>());
    });
  });
}


