
import 'package:app/controller/server_requests.dart';
import 'package:app/model/User.dart';
import 'package:app/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserListState extends State<UserList>{
  List<User> _userList = List<User>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _callUser();
  }

  void _callUser(){
    Server().load(User.all).then((users)=> {
      setState(() {
        _userList = users;
      isLoading = false;
      })
    });
  }

  Card _generateItemsList(BuildContext context, int index){
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

          title: Text(
            'Name : ${_userList[index].name}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Flexible(child:Text('Occupation : ${_userList[index].occupation} \nEmail : ${_userList[index].email} \nUpdated: ${timeago.format(DateTime.parse(_userList[index].updated_at))}',
                  style: TextStyle(color: Colors.white)))
            ],
          ),
          trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailPage(_userList[index])));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: Column(
          children:<Widget>[
            Expanded(
              child:ListView.builder(
                itemCount: _userList.length,
                itemBuilder: _generateItemsList,
              )
            ),
    Container(
        height: isLoading ? 50.0 : 0,
        color: Colors.white70,
        child: Center(
          child: new CircularProgressIndicator(),
        )),
          ],
        )
    );
  }


}

class UserList extends StatefulWidget {

  @override
  createState() => UserListState();
}