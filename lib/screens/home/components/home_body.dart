import 'package:cajero_automatico_app/providers/main_provider.dart';
import 'package:cajero_automatico_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MainProvider _mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                // color: Color.fromRGBO(32, 69, 109, 1.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CUENTAS',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cuenta independiente',
                            style: TextStyle(
                                color: kprimarycolorLight,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Selector<MainProvider, String>(
                            selector: (context, provider) =>
                                provider.bill.value,
                            builder: (context, bill, child) {
                              return Text(
                                'S/ $bill',
                                style: TextStyle(fontSize: 25),
                              );
                            },
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Saldo Disponible',
                          style: TextStyle(fontWeight: FontWeight.w200),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: Card(
                // color: Color.fromRGBO(32, 69, 109, 1.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TARJETA INGRESADA',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mastercard fpf',
                            style: TextStyle(
                                color: kprimarycolorLight,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/tarjeta.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            '5111**************',
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
