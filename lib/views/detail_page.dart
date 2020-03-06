import 'package:app/controller/server_requests.dart';
import 'package:app/model/User.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget{

  final User user;

  const DetailPage(this.user);

  @override
  DetailPageState createState() {
    // TODO: implement createState
    return DetailPageState(user:user);
  }
}

class DetailPageState extends State<DetailPage> {
 final User user;
 final TextEditingController _nameController = new TextEditingController();
 bool isEdit = false;
 String message = 'Edit';

  DetailPageState({Key key, this.user}) ;




  @override
  Widget build(BuildContext context) {






    final topContent = Stack(
      children: <Widget>[

        Container(
            padding: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,

            child: Container(
              child: Center(
                child:Text('loading image..', style: TextStyle(fontFamily: 'Avenir-Medium', color: Colors.grey[400]),),
              ),
            ))
      ],
    );

    final bottomContentText = Text(
      user.bio,
      style: TextStyle(fontSize: 18.0),
    );

    final readButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("TAKE THIS LESSON", style: TextStyle(color: Colors.white)),
        ));




    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          Row(children:<Widget>[
            Expanded(
                child:Text('Occupation : ${user.occupation}',style: TextStyle(fontWeight: FontWeight.bold),)
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          Row(children:<Widget>[
            Expanded(
                child:Text('Email : ${user.email}',style: TextStyle(fontWeight: FontWeight.bold),)
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          Row(children:<Widget>[
            Expanded(
                child:Text('Bio : ${user.bio}',style: TextStyle(fontWeight: FontWeight.bold),)
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          Row(children:<Widget>[
            Expanded(
                child:Text('Saved at : ',style: TextStyle(fontWeight: FontWeight.bold),)
            ),Expanded(
                child:Text('${timeago.format(DateTime.parse(user.created_at))}',
                  style: TextStyle(fontWeight: FontWeight.bold),)
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          Row(children:<Widget>[
            Expanded(
                child:Text('Updated at  : ',style: TextStyle(fontWeight: FontWeight.bold),)
            ),Expanded(
                child:Text('${timeago.format(DateTime.parse(user.updated_at))}',
                  style: TextStyle(fontWeight: FontWeight.bold),)
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          ],
      ),

    );
    final editContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "User Name",
                labelStyle: TextStyle(
                    color: Colors.black45, fontSize: 14),
                // hintText: "Email",
                // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
              ),
            ),
          Row(children:<Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "User Name",
                labelStyle: TextStyle(
                    color: Colors.black45, fontSize: 14),
                // hintText: "Email",
                // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
              ),
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          Row(children:<Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "User Name",
                labelStyle: TextStyle(
                    color: Colors.black45, fontSize: 14),
                // hintText: "Email",
                // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
              ),
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          Row(children:<Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "User Name",
                labelStyle: TextStyle(
                    color: Colors.black45, fontSize: 14),
                // hintText: "Email",
                // hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
              ),
            )
          ]),
          Container(
            height: 2,
            width:  double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),
          Row(children:<Widget>[
            Expanded(
                child:RaisedButton(
                  child: const Text('Edit '),
                  onPressed: _edit,
                )
            )
          ]),],
      ),

    );


    return Scaffold(
      appBar: AppBar(
        title:  Text(user.name.toUpperCase()),
      ),
      body: SingleChildScrollView (
          child: Column(
            children: <Widget>[ isEdit ?editContent: bottomContent],
          )
      ),
    );


  }

  void _edit(){
    if(isEdit){
      Server().update(user);
    }
    setState((){
      isEdit = !isEdit;
    });
  }





}