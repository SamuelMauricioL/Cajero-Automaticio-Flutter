import 'package:cajero_automatico_app/ClassBuilder.dart';
import 'package:cajero_automatico_app/providers/main_provider.dart';
import 'package:cajero_automatico_app/screens/home/home_screen.dart';
import 'package:cajero_automatico_app/screens/retiro/retiro_screen.dart';
import 'package:cajero_automatico_app/screens/transferencias/transferencias_screen.dart';
import 'package:cajero_automatico_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cajero Automatico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<MainProvider>(
          create: (_) => MainProvider(),
          lazy: false,
        ),
      ], child: MainWidget()),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('HomeScreen'),
      items: [
        KFDrawerItem.initWithPage(
          text:
              Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: Icon(Icons.home, color: Colors.white),
          page: HomeScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Transferencias',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.compare_arrows, color: Colors.white),
          page: TransferenciasScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Retiros',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          page: RetiroScreen(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage('assets/images/me.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Samuel Mauricio L.',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Puntos BBVE: 0',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Perfil',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Logout',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(color: kprimarycolor),
      ),
    );
  }
}
