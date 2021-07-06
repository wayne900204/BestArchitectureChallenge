import 'package:best_architecture_challenge/post_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (context) => PostProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'MyApp',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: PostPage(title: 'FlutterTaipei :)'),
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  PostPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    context.read<PostProvider>().fetchData(SortState.sortWithId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('使用 userId 排序'),
                        value: SortState.sortWithUserId,
                      ),
                      PopupMenuItem(
                        child: Text('使用 id 排序'),
                        value: SortState.sortWithId,
                      ),
                      PopupMenuItem(
                        child: Text('使用 title 排序'),
                        value: SortState.sortWithTitle,
                      ),
                      PopupMenuItem(
                        child: Text('使用 body 排序'),
                        value: SortState.sortWithBody,
                      )
                    ],
                onSelected: (SortState value) {
                  context.read<PostProvider>().fetchData(value);
                })
          ],
        ),
        body: MyListView());
  }
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var posts = context.select((PostProvider p) => p.posts);
    return ListView.separated(
      key: UniqueKey(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        var post = posts[index];
        return Container(
            padding: EdgeInsets.all(8),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: post.id.toString() + ". " + post.title,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  TextSpan(
                    text: '\n' + post.body,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "\nUser ID：" + post.userId.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ));
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
