import 'package:cajero_automatico_app/screens/transferencias/components/transferencias_body.dart';
import 'package:cajero_automatico_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

// ignore: must_be_immutable
class TransferenciasScreen extends KFDrawerContent {
  @override
  _TransferenciasScreenState createState() => _TransferenciasScreenState();
}

class _TransferenciasScreenState extends State<TransferenciasScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Container(
              color: kprimarycolorLight,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: widget.onMenuPressed),
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      'Transferencias',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  SizedBox(width: 15)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TransferenciasBody(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
