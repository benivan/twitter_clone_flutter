import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/repository/repository.dart';
import 'package:social_app/response/user_details_response.dart';
import 'package:social_app/theme/theme.dart';

class MyUserProfile extends StatefulWidget {
  @override
  _MyUserProfileState createState() => _MyUserProfileState();
}

class _MyUserProfileState extends State<MyUserProfile> {
  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetailsResponse>(future:repository.getUserDetails(),
      builder: (BuildContext context, AsyncSnapshot<UserDetailsResponse> snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.error);
              return Scaffold(body: Center(child: Text('${snapshot.error}')));
            }

            return Container(child: UserPage(userData: snapshot.data),
              // color: isLight(context)?Colors.grey.shade100:Colors.grey.shade900,
              color: isLight(context) ? Colors.grey.shade200 : Colors.black87,
            );

          case ConnectionState.none:
            break;
          case ConnectionState.active:
            break;
        }
        return Text('');
      });
  }
}

class UserPage extends StatefulWidget {
 final UserDetailsResponse userData;


 const UserPage({Key key, this.userData}) : super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  UserDetailsResponse userdetails;

  @override
  void initState() {
    userdetails = widget.userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.settings,color: Colors.black,),
          onPressed: (){},
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.logout,color: Colors.grey,),
            onPressed: (){

            },
          )
        ],
      ),
      
      body: Container(
        padding: EdgeInsets.only(left: 50),
        child:ListTile(
          focusColor: Colors.blue,
          leading:Material(
            shadowColor: Colors.grey.shade900,
            borderRadius:BorderRadius.circular(35),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                widget.userData.userCredentials.imageUrl,
              ),
            ),
          ) ,
          title:Row(
            children: [

              Text(userdetails.userCredentials.name == null ? "Your Name" : userdetails.userCredentials.name),
              Text(userdetails.userCredentials.handle),
            ],
          ) ,
          subtitle: Column(
            children: [
              Text(userdetails.userCredentials.email),
              SizedBox(height: 10,),
              Text(userdetails.userCredentials.bio == null ? "Bio ": userdetails.userCredentials.bio),
              Text(userdetails.userCredentials.website == null ? "website" : userdetails.userCredentials.website),
              Text(userdetails.userCredentials.location == null ? "location" : userdetails.userCredentials.location),
            ],
          ),
        ),
      ),
    );
  }
}

