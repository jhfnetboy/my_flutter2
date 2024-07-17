import 'dart:convert';
import 'dart:io';
import 'dart:async';
// import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
import 'package:webauthn/webauthn.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAStar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const MyLoginPage(title: 'AAStar Login Page'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});
  final String title;
  // final String BaseUrl = "https://anotherairaccountcommunitynode.onrender.com";

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String _response = "No response";
  String interfaceAPI = ""; //input from textInput
  int times = 0;
  // Authenticator(bool authencationRequired, bool strongboxRequired)
  final authenticator = Authenticator(true, true);
  final String firstAPIUrl =
      "https://anotherairaccountcommunitynode.onrender.com/api/passkey/v1/reg";
  // String BaseUrl = "https://anotherairaccountcommunitynode.onrender.com";
  final String APIUrl2 =
      "https://anotherairaccountcommunitynode.onrender.com/api/passkey/v1/reg";
  final String APIUrl3 =
      "https://anotherairaccountcommunitynode.onrender.com/api/passkey/v1/reg/verify";
  final String APIUrl4 =
      "https://anotherairaccountcommunitynode.onrender.com/api/passkey/v1/sign";
  final String APIUrl5 =
      "https://anotherairaccountcommunitynode.onrender.com/api/passkey/v1/sign/verify";
  final String APIUrl6 =
      "https://anotherairaccountcommunitynode.onrender.com/api/passkey/v1/payment/sign";
  final String APIUrl7 =
      "https://anotherairaccountcommunitynode.onrender.com/api/passkey/v1/payment/sign/verify";

  Map<String, dynamic> data2 = {
    "captcha": "111111",
    "email": "jhfnetboy@aastar.org",
    "network": "ethereum-mainnet",
    "origin": "https://aastar.org"
  };

  Map<String, dynamic> data3 = {
    "captcha": "111111",
    "email": "jhfnetboy@aastar.org",
    "network": "ethereum-mainnet",
    "origin": "https://aastar.org"
  };

  Map<String, dynamic> data4 = {
    "captcha": "111111",
    "email": "jhfnetboy@aastar.org",
    "network": "ethereum-mainnet",
    "origin": "https://aastar.org"
  };
  Map<String, dynamic> data5 = {
    "captcha": "111111",
    "email": "jhfnetboy@aastar.org",
    "network": "ethereum-mainnet",
    "origin": "https://aastar.org"
  };

  Map<String, dynamic> data6 = {
    "captcha": "111111",
    "email": "jhfnetboy@aastar.org",
    "network": "ethereum-mainnet",
    "origin": "https://aastar.org"
  };

  Map<String, dynamic> data7 = {
    "captcha": "111111",
    "email": "jhfnetboy@aastar.org",
    "network": "ethereum-mainnet",
    "origin": "https://aastar.org"
  };

  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void handleSelection(String selection) {
    debugPrint('Selected option: $selection');
    // var credentialOptions = _getResponse2();
    Map<String, dynamic> credentialOptions = {
      "rp": {"name": "https://aastar.org", "id": " aastar.org"},
      "user": {
        "name": "jhfnetboy@aastar.org",
        "displayName": "jhfnetboy@aastar.org",
        "id": "amhmbmV0Ym95QGFhc3Rhci5vcmc"
      },
      "challenge": "WC0LkCiCIskeygTeEC6pHXxVlQz5yFl234-adWIpew4",
      "pubKeyCredParams": [
        {"type": "public-key", "alg": -7},
        {"type": "public-key", "alg": -35},
        {"type": "public-key", "alg": -36},
        {"type": "public-key", "alg": -257},
        {"type": "public-key", "alg": -258},
        {"type": "public-key", "alg": -259},
        {"type": "public-key", "alg": -37},
        {"type": "public-key", "alg": -38},
        {"type": "public-key", "alg": -39},
        {"type": "public-key", "alg": -8}
      ],
      "timeout": 300000,
      "authenticatorSelection": {
        "authenticatorAttachment": "platform",
        "requireResidentKey": false,
        "userVerification": required
      }
    };

    makeCredentialFromJson(credentialOptions);
  }

  // var jsonOptions = '{"name":"myname", "age":"22"}';
  // var parsedJson = json.decode(jsonOptions);
  void makeCredentialFromJson(Map<String, dynamic> optionsCredential) {
    final makeCredentialOptions =
        MakeCredentialOptions.fromJson(optionsCredential);
    final attestation = authenticator.makeCredential(makeCredentialOptions);
    // Uint8List attestationBytes = attestation.asCBOR();
    // String attestationJson = attestation.asJSON();
    debugPrint('attestation: $attestation');
  }

  Dio dio = Dio();

  Future<void> _getResponse2(
      String APIUrl, Map<String, dynamic> dataPost, Options optionsPost) async {
    try {
      Response resP =
          await dio.post(APIUrl, data: dataPost, options: optionsPost);
    } catch (e) {
      setState(() {
        _response = "Error: $e";
        // _response =
      });
    }
  }

  Future<void> _getResponse() async {
    try {
      Response resP = await dio.post(APIUrl2,
          data: data2,
          options: Options(
            headers: {
              Headers.contentTypeHeader: "application/json",
              HttpHeaders.userAgentHeader:
                  "Apifox/1.0.0 (https://apifox.com)" // Set the content-length.
            },
          ));
      switch (resP.statusCode) {
        case 400:
          _response = "Response status code is 400.";
        case 200:
          _response = "Response status code is 200.";
          break;
        default:
          _response = "Response status code is ${resP.statusCode}";
      }
      setState(() {
        // debugPrint((resP).toString());
        // _response = resP.toString();
        times = times + 1;
        debugPrint("Begin -----------------------");
        debugPrint("Invoke time is: ${times}");
        debugPrint("Invoking interface: ${interfaceAPI}");
        debugPrint("Response Status is: ${resP.statusMessage}");
        debugPrint("Response Status Code is: ${resP.statusCode}");
        debugPrint("Response Data is: ${resP.data}");
        debugPrint("Response Headers is: ${resP.headers}");
        debugPrint("Response realUri is: ${resP.realUri}");
        debugPrint("Response requestOptions is: ${resP.requestOptions}");
        print((resP.data).runtimeType);
        debugPrint("----------------------- ${times} End");
        // Map<String, dynamic> resp = jsonDecode(resP.data);
        // print('Name: ${user['name']}');
        // debugPrint((resp['rp']['user']['name']).toString());
        // _response = _response + (resp['rp']['user']['name']).toString();
        // print(jsonEncode(resP.data));
      });
    } catch (e) {
      setState(() {
        _response = "Error: $e";
        // _response =
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
                // controller: myController, //todo ?
                'Type 1 or 2 or number to autocomplete the following possible results: \n ${AutocompleteBasic._kOptions}.'),
            AutocompleteBasic(onSelected: handleSelection),
            Text(
              _response,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getResponse,
        tooltip: 'Invoke',
        child: const Icon(Icons.rocket_launch),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AutocompleteBasic extends StatelessWidget {
  const AutocompleteBasic({super.key, required this.onSelected});
  final void Function(String) onSelected; // 添加这行

  static const List<String> _kOptions = <String>[
    '1. /api/passkey/v1/reg/prepare \n',
    '2. /api/passkey/v1/reg \n',
    '3. /api/passkey/v1/reg/verify \n',
    '4. /api/passkey/v1/sign \n',
    '5. /api/passkey/v1/sign/verify \n',
    '6. /api/passkey/v1/payment/sign \n',
    '7. /api/passkey/v1/payment/sign/verify'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: onSelected,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
