
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 100,left: 50),
            child: Image.network('https://scontent.fpat1-1.fna.fbcdn.net/v/t31.0-1/p160x160/18527100_1287391928042288_937466013115721673_o.jpg?_nc_cat=105&_nc_sid=dbb9e7&_nc_ohc=FA45sbziYpQAX9PIpVk&_nc_ht=scontent.fpat1-1.fna&tp=6&oh=fe3caf891e60543d3cac5a0b1349d685&oe=5FADBFEE'),
          ),
          Positioned(top:140,left:10,child: Text('vikash',style:TextStyle(color: Colors.black,fontSize: 20
          ),))
        ],
      ),
    );
  }
}
