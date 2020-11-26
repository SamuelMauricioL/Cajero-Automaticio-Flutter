import 'package:cajero_automatico_app/providers/main_provider.dart';
import 'package:cajero_automatico_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferenciasBody extends StatefulWidget {
  TransferenciasBody({Key key}) : super(key: key);

  @override
  _TransferenciasBodyState createState() => _TransferenciasBodyState();
}

class _TransferenciasBodyState extends State<TransferenciasBody> {
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
                    'CUENTA DE RETIRO',
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    ' (2 de 3)',
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
                onChanged: (account) =>
                    _mainProvider.validateBill(retirementAccount: account),
                maxLength: 16,
                decoration: InputDecoration(
                  labelText: "Otras cuentas",
                  hintText: "Número de cuenta o CCI",
                  errorText: _mainProvider.retirementAccount.error,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'IMPORTE',
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    ' (3 de 3)',
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
                  labelText: "Importe",
                  hintText: "Soles",
                  errorText: _mainProvider.amount.error,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 65),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 200,
            height: 60,
            child: FlatButton(
              color: kprimarycolorLight,
              onPressed: () => _mainProvider.makeTransfer(context: context),
              child: Text(
                "Transferir",
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
