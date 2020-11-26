import 'package:cajero_automatico_app/screens/home/components/home_body.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends KFDrawerContent {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: widget.onMenuPressed),
                  ),
                ),
                Expanded(
                  child: Center(child: Text('Hola, Samuel Mauricio L.')),
                ),
                SizedBox(width: 15)
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: HomeBody(),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
