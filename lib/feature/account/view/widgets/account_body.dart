import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/account/controller/account_controller.dart';
import 'package:pott_vendor/feature/account/view/widgets/account_textfield.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key, required this.controller}) : super(key: key);

  final AccountController controller;

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
                  controller: controller.firstNameTextController,
                  onChanged: (value) {
                    if (!controller.isUpdateButtonEnabled || value.isEmpty) {
                      controller.checkEnableUpdateButton();
                    }
                  },
                  title: "First Name",
                  hintText:
                      "${controller.authController.auth?.firstName ?? "N/A"}",
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Flexible(
                flex: 3,
                child: AccountTextField(
                  controller: controller.lastNameTextController,
                  onChanged: (value) {
                    if (!controller.isUpdateButtonEnabled || value.isEmpty) {
                      controller.checkEnableUpdateButton();
                    }
                  },
                  title: "Last Name",
                  hintText:
                      "${controller.authController.auth?.lastName ?? "N/A"}",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
            controller: controller.emailTextController,
            onChanged: (value) {
              if (!controller.isUpdateButtonEnabled || value.isEmpty) {
                controller.checkEnableUpdateButton();
              }
            },
            title: "Email",
            hintText: "Example@gmail.com",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
            controller: controller.phoneNumberTextController,
            onChanged: (value) {
              if (!controller.isUpdateButtonEnabled || value.isEmpty) {
                controller.checkEnableUpdateButton();
              }
            },
            title: "Phone Number",
            hintText: "${controller.authController.phoneNumberFormat()}",
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
              controller: controller.addressTextController,
              onChanged: (value) {
                if (!controller.isUpdateButtonEnabled || value.isEmpty) {
                  controller.checkEnableUpdateButton();
                }
              },
              title: "Address",
              hintText: "No 1, St 310, Phnom Penh"),
          const SizedBox(
            height: 20.0,
          ),
          AccountTextField(
            controller: controller.passwordTextController,
            onChanged: (value) {
              if (!controller.isUpdateButtonEnabled || value.isEmpty) {
                controller.checkEnableUpdateButton();
              }
            },
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
