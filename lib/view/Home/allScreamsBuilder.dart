import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/model/screams_response.dart';
import 'package:social_app/repository/repository.dart';
import 'package:social_app/theme/theme.dart';
import 'package:social_app/theme/theme_changer.dart';
import 'package:social_app/view/Home/scream_detail_page.dart';

class AllScreamsBuilder extends StatefulWidget {
  @override
  _AllScreamsBuilderState createState() => _AllScreamsBuilderState();
}

class _AllScreamsBuilderState extends State<AllScreamsBuilder> {
  Repository repository = Repository();
  Future<List> screamsFuture;

  @override
  void initState() {
    super.initState();
    screamsFuture = repository.fetchAllScreams();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScreamsResponse>>(
        future: screamsFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<ScreamsResponse>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Center(child: Text(snapshot.error.toString()));
              if (snapshot.data.isEmpty || snapshot.data.first.body == "") {
                return Center(child: Text('Not Found'));
              }
              return Container(child: ScreamBuild(screams: snapshot.data));
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
          }
          return Text('');
        });
  }
}

class ScreamBuild extends StatefulWidget {
  final List<ScreamsResponse> screams;

  const ScreamBuild({Key key, this.screams}) : super(key: key);

  @override
  _ScreamBuildState createState() => _ScreamBuildState();
}

class _ScreamBuildState extends State<ScreamBuild> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger =
        Provider.of<ThemeChanger>(context, listen: true);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    Repository repository = Repository();

    return Scaffold(
      backgroundColor: isLight(context) ? Colors.grey.shade200 : Colors.black87,
      drawer: Container(),
      appBar: AppBar(),
      body: Scrollbar(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10),
              physics: BouncingScrollPhysics(),
              children: List.generate(widget.screams.length, (index) {
                ScreamsResponse scream = widget.screams.elementAt(index);
                return Stack(
                  children: [
                    Card(
                      color: isLight(context)
                          ? Colors.white
                          : Colors.grey.shade900.withOpacity(0.45),
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 3),
                      elevation: 18,
                      shadowColor: isLight(context)
                          ? Colors.white.withOpacity(.5)
                          : Colors.black.withOpacity(0.1),
                      borderOnForeground: true,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreamDetailPage(
                                      screamId: scream.screamId)));
                        },
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            scream.userHandle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              scream.body,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: isLight(context)
                                      ? Colors.black87
                                      : Colors.grey.shade200),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.thumb_up_alt_outlined),
                                        color: isLight(context)
                                            ? Colors.grey.shade800
                                            : Colors.grey,
                                        onPressed: () {}),
                                    Text(scream.likeCount.toString())
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        icon:
                                            Icon(Icons.thumb_down_alt_outlined),
                                        color: isLight(context)
                                            ? Colors.grey.shade800
                                            : Colors.grey,
                                        onPressed: () {}),
                                    Text(scream.unlikeCount.toString())
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.messenger_outline),
                                        color: isLight(context)
                                            ? Colors.grey.shade800
                                            : Colors.grey,
                                        onPressed: () {}),
                                    Text(scream.commentCount.toString())
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        contentPadding: EdgeInsets.all(5),
                        isThreeLine: true,
                        leading: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(scream.imageUrl),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }))),
    );
  }
}
