import 'package:cajero_automatico_app/providers/main_provider.dart';
import 'package:cajero_automatico_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RetiroBody extends StatelessWidget {
  const RetiroBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider _mainProvider = Provider.of<MainProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                color: kprimarycolorDark,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CUENTA DE RETIRO',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cuenta independiente',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Selector<MainProvider, String>(
                            selector: (context, provider) =>
                                provider.bill.value,
                            builder: (context, bill, child) {
                              return Text(
                                'S/ $bill',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              );
                            },
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Saldo Disponible',
                          style: TextStyle(
                              fontWeight: FontWeight.w200, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'CANTIDAD A RETIRAR',
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    ' (2 de 2)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                //initialValue: signUpProvider.name ?? '',
                onChanged: (amount) =>
                    _mainProvider.validateAmount(amount: amount),
                decoration: InputDecoration(
                  labelText: "Cantidad",
                  hintText: "Cantidad",
                  errorText: _mainProvider.amount.error,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 200,
            height: 60,
            child: FlatButton(
              color: kprimarycolorLight,
              onPressed: () => _mainProvider.makeRetiro(context: context),
              child: Text(
                "Retirar",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
