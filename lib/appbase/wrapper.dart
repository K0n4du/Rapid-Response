import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidresponse/appbase/authenticate.dart';

import '../models/usermodel.dart';
import 'navigation.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    // ignore: avoid_print
    print(user);
    if (user == null) {
      return const Authenticate();
    } else {
      return const AppNavigation();
    }
  }
}
