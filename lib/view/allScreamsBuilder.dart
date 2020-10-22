import 'package:flutter/material.dart';
import 'package:social_app/model/screams_response.dart';
import 'package:social_app/repository/repository.dart';
import 'package:social_app/view/scream_detail_page.dart';

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
    screamsFuture = repository.getAllScreams();
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
    return Scrollbar(
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            physics: BouncingScrollPhysics(),
            children: List.generate(widget.screams.length, (index) {
              ScreamsResponse scream = widget.screams.elementAt(index);
              return Card(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreamDetailPage(screamId: scream.screamId)));
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
                          color: Colors.black.withOpacity(.8),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up_alt_outlined),
                              label: Text(scream.likeCount.toString())),
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_down_alt_outlined),
                              label: Text(scream.unlikeCount.toString())),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.messenger_outline),
                            label: Text(scream.commentCount.toString()),
                          )
                        ],
                      )
                    ],
                  ),
                  contentPadding: EdgeInsets.all(5),
                  isThreeLine: true,
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(scream.imageUrl),
                  ),
                ),
              );
            })
        )
    );
  }
}
