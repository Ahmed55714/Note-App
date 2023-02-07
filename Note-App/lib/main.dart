import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:htttps/auth_screen.dart';
import 'package:htttps/page/notes_page.dart';
import 'package:htttps/providers/auth.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter',
          theme: ThemeData(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.blueGrey.shade900,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          home: AuthScreen(),
          routes: {
            '/note-page': (context) => NotesPage(),
          },
        ),
      ),
    );
  }
}
