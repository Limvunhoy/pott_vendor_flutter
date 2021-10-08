import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/account/view/widgets/account_textfield.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: AccountTextField(
                  title: "First Name",
                  hintText: "Firstname",
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Flexible(
                flex: 3,
                child: AccountTextField(
                  title: "Last Name",
                  hintText: "Lastname",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
            title: "Email",
            hintText: "Example@gmail.com",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
            title: "Phone Number",
            hintText: "+855 123456",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
              title: "Address", hintText: "No 1, St 310, Phnom Penh"),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
            title: "Address",
            hintText: "No 1, St 310, Phnom Penh",
          ),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
            title: "Password",
            hintText: "••••••",
            obscureText: true,
            isAutoCorrect: false,
            isEnableSuggestion: false,
          ),
        ],
      ),
    );
  }
}
