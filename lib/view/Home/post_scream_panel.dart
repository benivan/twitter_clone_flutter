import 'package:flutter/material.dart';
import 'package:social_app/app_constants.dart';
import 'package:social_app/model/scream.dart';
import 'package:social_app/repository/repository.dart';
import 'package:social_app/shared/text_input_decoraion.dart';
import 'package:social_app/theme/theme.dart';

class PostScreamPanel extends StatefulWidget {
  final Function(Scream) postButtonClicked;

  const PostScreamPanel({Key key, this.postButtonClicked}) : super(key: key);

  @override
  _PostScreamPanelState createState() => _PostScreamPanelState();
}

class _PostScreamPanelState extends State<PostScreamPanel> {
  Repository repository = Repository();

  String _scream;

  @override
  void initState() {
    _scream = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TextFormField(
                cursorColor: isLight(context) ? Colors.black : Colors.white,
                decoration: textInputDecorationForCommentPanel(
                    isLight(context), postScremaPanelHint),
                textInputAction: TextInputAction.send,
                maxLines: null,
                autofocus: true,
                validator: (val) => val.isEmpty ? "Scream can't  empty" : null,
                onChanged: (val) => setState(() => _scream = val),
                onFieldSubmitted: _submitButtomclicked,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _submitButtomclicked(String value) {
    repository.postScream(_scream).then((value) {
      widget.postButtonClicked(value);
      Navigator.pop(context);
    });
  }
}
