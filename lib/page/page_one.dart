import 'package:bloc_auth/page/page_two.dart';
import 'package:bloc_auth/pattern/bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BLOC PATTERN - CANDRA R',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                StreamBuilder<Object>(
                    stream: bloc.email,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: (s) => bloc.emailChanged.add(s),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your email",
                            labelText: "Email",
                            errorText: snapshot.error),
                      );
                    }),
                SizedBox(
                  height: 20.0,
                ),
                StreamBuilder<Object>(
                    stream: bloc.password,
                    builder: (context, snapshot) {
                      return TextField(
                        onChanged: (s) => bloc.passwordChanged.add(s),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your password",
                            labelText: "Password",
                            errorText: snapshot.error),
                      );
                    }),
                SizedBox(
                  height: 20.0,
                ),
                StreamBuilder<bool>(
                    stream: bloc.submitCheck,
                    builder: (context, snapshot) {
                      return RaisedButton(
                        color: Colors.blue,
                        onPressed: snapshot.hasData
                            ? () => changeThePage(context)
                            : null,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
    );
  }
}
