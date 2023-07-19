
// Services
import 'package:chatify/services/cloud_storage_service.dart';
import 'package:chatify/services/database_service.dart';
import 'package:chatify/services/media_service.dart';
import 'package:chatify/services/navigation_service.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 import 'package:get_it/get_it.dart';

//packages

import 'package:firebase_core/firebase_core.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    required Key key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_){

      _setup().then((_) => widget.onInitializationComplete(),
    );
      
    }
    
    );
    
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      theme: ThemeData(
          backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0)),
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(fit: BoxFit.contain, image: AssetImage("assets/images/logo.png"))
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setup() async{

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();

  }

  void _registerServices(){
    GetIt.instance.registerSingleton<NavigationService>(
      NavigationService(),
    );

    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );

    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );

    GetIt.instance.registerSingleton<DatabaseService>(
      DatabaseService(),
    );
  }
}
