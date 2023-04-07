import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCirrenciesList',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 37, 35, 35) ,
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white24,
        appBarTheme:const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 37, 35, 35),
          titleTextStyle: TextStyle(
            color:Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,)
          ) ,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme:  TextTheme(
          bodyMedium:const TextStyle(
            color:Colors.white,
            fontWeight:FontWeight.w700,
            fontSize: 20, 
            ),
          labelSmall:TextStyle(
            color:Colors.white.withOpacity(0.6),
            fontWeight:FontWeight.w500,
            fontSize: 14, 
            ),   
 
        ),
      ),
      routes: {
        '/':(context)=> CryptoListScreen(),
        '/coin':(context)=>CryptoCoinScreen(),
      },
      
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key,});



 

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {


  @override
  Widget build(BuildContext context) {
    final theme= Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('CryptoCirrenciesList'),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index)=>const Divider(),
        itemBuilder:(context,i) { 
        const coinName='Bitcoin';
        return ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin_logo.svg',
            height: 25, 
            width: 25,
            ),
          title: Text(
            coinName,
            style:theme.textTheme.bodyMedium,
          ),
          subtitle: Text(
            '2000\$',
          style:theme.textTheme.labelSmall,
            ),
            trailing:const Icon(
              Icons.arrow_forward_ios,
            ) ,
            onTap: () {
              Navigator.of(context).pushNamed(
                '/coin', 
                arguments:coinName,
              );
            },
        );},
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  
  String? coinName;
  @override
  void didChangeDependencies() {
    final args=ModalRoute.of(context)?.settings.arguments;
    assert(args!=null && args is String, 'You must provide string args');
    // if(args==null) {
    //   log('You ,ust provide args');
    //   return;
    // }
    // if(args is! String){
    //   log('You must provide string args');
    //   return;
    // }

    coinName=args as String;

    setState(() {});

    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}