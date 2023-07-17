// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rapidresponse/Settings/settings.dart';
import 'package:rapidresponse/loginpage/signup.dart';

import '../../loginpage/login.dart';
import '../../services/authentication.dart';
import 'commondetails.dart';

//
//
// APP BUTTONS
//
//
class Buttons extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;

  const Buttons({
    Key? key,
    required this.iconData,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(iconData),
      label: Text(
        buttonText,
        style: myTextStyle,
      ),
      style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(150, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}

//
//
// APP BUTTONS alt
//
//
class ButtonsAlt extends StatelessWidget {
  final IconData iconData;
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;

  const ButtonsAlt({
    Key? key,
    required this.iconData,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: myButtonColorAlt,
      ),
      label: Text(
        buttonText,
        style: myTextStyleAlt,
      ),
      style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(150, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}

//
//
// TEXT BUTTONS
//
//
class TButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const TButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: myTextStyle.copyWith(
              decoration: TextDecoration.underline,
              color: const Color.fromRGBO(50, 186, 124, 1)),
        ));
  }
}

//
//
// CARD BUTTONS
//
//
class Cardbutton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;

  const Cardbutton(
      {Key? key,
      required this.text,
      required this.image,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              const Divider(),
              Flexible(
                child: Text(
                  text,
                  style: myTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//ACCOUNT MENU BUTTON
//
//
class UserAccountWidget extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  final MyUser = FirebaseAuth.instance.currentUser!;

  UserAccountWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.person_pin,
        color: myButtonColor,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
            child: Text(
          'Hello, ${MyUser.displayName ?? 'Guest'}.',
          style: myTextStyle,
        )),
        const PopupMenuDivider(),
        PopupMenuItem(
            child: ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: Text(
            'Settings',
            style: myTextStyle,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
        )),
        PopupMenuItem(
            child: ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: Text(
            'Logout',
            style: myTextStyle,
          ),
          onTap: () async {
            await _auth.SignOut();
          },
        ))
      ],
    );
  }
}

//
//
//
//
//
class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    required this.labeltext,
    required this.widget,
  });
  final String labeltext;
  final Loginpage widget;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        widget.toggleView();
      },
      child: Text(
        labeltext,
        style: myTextStyle.copyWith(
          decoration: TextDecoration.underline,
          color: const Color.fromRGBO(50, 186, 124, 1),
        ),
      ),
    );
  }
}

//
//
//SWITCH BUTTON
//
//
class SwitchButtons extends StatelessWidget {
  const SwitchButtons({
    super.key,
    required this.labeltext,
    required this.widget,
  });
  final String labeltext;
  final SignUp widget;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        widget.toggleView();
      },
      child: Text(
        labeltext,
        style: myTextStyle.copyWith(
          decoration: TextDecoration.underline,
          color: const Color.fromRGBO(50, 186, 124, 1),
        ),
      ),
    );
  }
}

//
//
// LIST DETAILS
//
//
class ListDetails extends StatelessWidget {
  final String titletext;
  final IconData iconData;
  final String username;

  const ListDetails(
      {Key? key,
      required this.titletext,
      required this.iconData,
      required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: Colors.red),
      title: Text(titletext),
      trailing: Text(username),
    );
  }
}
