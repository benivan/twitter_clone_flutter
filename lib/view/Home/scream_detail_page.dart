import 'package:flutter/material.dart';
import 'package:social_app/repository/repository.dart';
import 'package:social_app/response/all_scream_response.dart';
import 'package:social_app/response/single_scream_response.dart';
import 'package:social_app/theme/theme.dart';

class ScreamDetailPage extends StatelessWidget {
  final String screamId;

  const ScreamDetailPage({Key key, this.screamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<SingleScreamResponse>(
          future: Repository().fetchScreamById(screamId: screamId),
          builder:
              (BuildContext context, AsyncSnapshot<SingleScreamResponse> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  print(snapshot.error);
                  print(screamId);
                  return Center(child: Text('${snapshot.error}'));
                }

                return Container(child: BuildScream(scream: snapshot.data),
                    // color: isLight(context)?Colors.grey.shade100:Colors.grey.shade900,
                  color: isLight(context) ? Colors.grey.shade200 : Colors.black87,
                );

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
  final SingleScreamResponse scream;

  const BuildScream({Key key, this.scream}) : super(key: key);

  @override
  _BuildScreamState createState() => _BuildScreamState();
}

class _BuildScreamState extends State<BuildScream> {
  @override
  Widget build(BuildContext context) {
    var lengthOfComments = widget.scream.comments.length;
    return ListTile(
      title: Text(
        widget.scream.userHandle,
        style: TextStyle(fontSize: 20),
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(widget.scream.image),
      ),
      dense: true,
      subtitle: Column(
        mainAxisSize: MainAxisSize.max,
          children: [
        Text(
          widget.scream.body,
          style: TextStyle(
            fontSize: 16,
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
            Column(
              children: [
                IconButton(
                    icon:
                    Icon(Icons.thumb_up_alt_outlined),
                    color: isLight(context)
                        ? Colors.grey.shade800
                        : Colors.deepPurple.shade200,
                    onPressed: () {}),
                Text(widget.scream.likeCount.toString(),
                style: TextStyle(
                  color: isLight(context)
                      ? Colors.grey.shade800
                      : Colors.deepPurple.shade200,
                ),)
              ],
            ),
            Column(
              children: [
                IconButton(
                    icon:
                    Icon(Icons.thumb_down_alt_outlined),
                    color: isLight(context)
                        ? Colors.grey.shade800
                        : Colors.deepPurple.shade200,
                    onPressed: () {}),
                Text(widget.scream.unlikeCount.toString(),
                style: TextStyle(
                  color: isLight(context)
                      ? Colors.grey.shade800
                      : Colors.deepPurple[200],
                ),)
              ],
            ),
            Column(
              children: [
                IconButton(
                    icon:
                    Icon(Icons.messenger_outline_outlined),
                    color: isLight(context)
                        ? Colors.grey.shade800
                        : Colors.deepPurple.shade200,
                    onPressed: () {}),
                Text(widget.scream.commentCount.toString(),
                style: TextStyle(
                  color: isLight(context)
                      ? Colors.grey.shade800
                      : Colors.deepPurple[200],
                ),)
              ],
            )

          ],
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: lengthOfComments,
            itemBuilder: (context, index) => Card(
              color: isLight(context) ? Colors.white : Colors.grey.shade900.withOpacity(.45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),

              child: Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        widget.scream.comments.elementAt(index).imageUrl),
                  ),
                  title: Text(widget.scream.comments.elementAt(index).userHandle),
                  subtitle: Text(widget.scream.comments.elementAt(index).body),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

}
