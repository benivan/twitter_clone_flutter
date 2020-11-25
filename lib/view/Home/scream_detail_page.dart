import 'package:flutter/material.dart';
import 'package:social_app/model/scream_response.dart';
import 'package:social_app/repository/repository.dart';

class ScreamDetailPage extends StatelessWidget {
  final String screamId;

  const ScreamDetailPage({Key key, this.screamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<ScreamResponse>(
          future: Repository().getScreamById(screamId: screamId),
          builder:
              (BuildContext context, AsyncSnapshot<ScreamResponse> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  print(snapshot.error); //Print Error
                  print(screamId);
                  return Center(child: Text('${snapshot.error}'));
                }

                return Container(
                    child: BuildScream(scream: snapshot.data));

              case ConnectionState.none:
                break;
              case ConnectionState.active:
                break;
            }
            return Text('');
          }),
    );
  }
}

class BuildScream extends StatefulWidget {
  final ScreamResponse scream;

  const BuildScream({Key key, this.scream}) : super(key: key);

  @override
  _BuildScreamState createState() => _BuildScreamState();
}

class _BuildScreamState extends State<BuildScream> {
  @override
  Widget build(BuildContext context) {
    var lengthOfComments = widget.scream.comments.length;
    return Container(
      child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: Text(widget.scream.userHandle),
          ),
          // contentPadding: EdgeInsets.all(5),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(widget.scream.image),
          ),
          dense: true,
          subtitle: Column(children: [
            Text(
              widget.scream.body,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(.8),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(widget.scream.createdAt.toString()),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_up_alt_outlined,
                    ),
                    label: Text(widget.scream.likeCount.toString())),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_down_alt_outlined),
                    label: Text(widget.scream.unlikeCount.toString())),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.messenger_outline,color: Colors.orangeAccent,),
                  label: Text(widget.scream.commentCount.toString()),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ]),
          isThreeLine: true),
    );
  }

  Widget allComments(int length) {
    return Flexible(
      child: Column(
        children: Iterable.generate(
            length,
            (i) => ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        widget.scream.comments.elementAt(i).imageUrl),
                  ),
                  title: Text(widget.scream.comments.elementAt(i).userHandle),
                  subtitle: Text(widget.scream.comments.elementAt(i).body),
                )).toList(),
      ),
    );
  }
}
