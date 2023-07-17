import 'package:flutter/material.dart';

import '../../appbase/widgets/buttons.dart';
import '../../appbase/widgets/commondetails.dart';

// ignore: must_be_immutable
class LoginContent extends StatelessWidget {
  LoginContent({
    super.key,
  });

  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buttons(
                iconData: Icons.abc_outlined,
                buttonText: 'Facebook',
                onPressed: () {},
                buttonColor: myforegroundColor,
              ),
              const Pading(),
              Buttons(
                iconData: Icons.info,
                buttonText: 'Google',
                onPressed: () {},
                buttonColor: myforegroundColor,
              )
            ],
          ),
          TButton(
            text: 'Forgot Your Password',
            onPressed: () {},
          ),
          
        ],
      ),
    );
  }
}
