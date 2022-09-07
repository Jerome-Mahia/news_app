import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);

  runApp(ProviderScope(child: const MyApp()));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Color.fromARGB(244, 255, 255, 255),
      ),
      home: LoginScreen(),
    );
  }
}

// final authProvider = StateProvider((ref) => false);

// class LoginPage extends ConsumerWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: Center(
//         child: Form(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       'Flutter News',
//                       style: TextStyle(
//                         fontSize: 70,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                   ],
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Username',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Kindly enter Username';
//                     };
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Kindly enter Password';
//                     };
//                   },
//                 ),
//                 SizedBox(
//                   height: 27,
//                 ),
//                 FloatingActionButton.extended(
//                   onPressed: () {
//                     ref.read(authProvider.notifier).state = true;
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (((context) => HomeScreen()))));
//                   },
//                   label: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       'Login In',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Flutter News',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kindly enter Username';
                    } else if (value == 'Jerome') {
                      return null;
                    } else {
                      return 'Kindly enter correct Username';
                    }
                    ;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kindly enter Password';
                    } else if (value == '12345') {
                      return null;
                    } else {
                      return 'Kindly enter correct Password';
                    };
                  },
                ),
                SizedBox(
                  height: 27,
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logging In...')),
                      );
                      // ref.read(authProvider.notifier).state = true;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (((context) => HomeScreen()))));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid Credentials!')),
                      );
                    }
                    ;
                  },
                  label: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Login In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
