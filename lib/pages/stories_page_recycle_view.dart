import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nytflutter/helpers/fetch_articles_helper.dart';
import 'package:nytflutter/helpers/launch_helper.dart';
import 'package:nytflutter/models/Article.dart';
import 'package:nytflutter/pages/article_preview_page.dart';
import 'package:nytflutter/pages/web_view_page.dart';
import 'package:nytflutter/widgets/server_error_widget.dart';

class StoriesPageRecycleView extends StatefulWidget {
  const StoriesPageRecycleView({Key key, @required this.category})
      : super(key: key);
  final String category;

  @override
  _StoriesPageRecycleViewState createState() => _StoriesPageRecycleViewState();
}

class _StoriesPageRecycleViewState extends State<StoriesPageRecycleView> {
  String data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: fetchArticles(widget.category),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Loading...',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SpinKitCircle(
                          color: Colors.black,
                          size: 50,
                        ),
                      ],
                    ),
                  );
                default:
                  if (snapshot.hasError)
                    return ServerErrorWidget();
                  else {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Center(
                          child: Text(
                            'The New York Times\n${widget.category.toUpperCase()} Articles',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.tinos(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        createListView(
                          context,
                          snapshot,
                        ),
                      ],
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;

    return ListView.builder(
      primary: false,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: values.results.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ArticlePreviewPage(
                    title: values.results[index].title,
                    abstract: values.results[index].abstract,
                    imageUrl: values.results[index].multimedia[0].url,
                    smallImageUrl: values.results[index].multimedia[3].url,
                    url: values.results[index].url,
                  );
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: values.results[index].multimedia[0].url,
                    child: Container(
                      height: 250,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            values.results[index].multimedia[3].url,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Text(
                      values.results[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
