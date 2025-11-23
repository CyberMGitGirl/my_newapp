import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_newapp/widgets/custom_button.dart';
import 'package:my_newapp/widgets/custom_textfield.dart';
import 'package:otp_input/otp_input.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool showOtp = false;
  late Timer timer;
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the email address you will like to receive your recovery pin",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            CustomTextField(label: "Email Address"),
            showOtp
                ? _buildOtpView()
                : CustomButton(
                    onPressed: () {
                      setState(() {
                        showOtp = true;
                      });

                      // set re-request otp timer
                      timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        print("ticked");
                        if(seconds <= 1){
                          timer.cancel();
                        }

                        setState(() {
                          seconds--;
                        });

                      });
                    },
                    text: "Get OTP",
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpView() {
    return Column(
      spacing: 8,
      children: [
        Text("Check your email address and enter the otp you received"),
        OtpInputField(
          otpInputFieldCount: 5,
          fieldStyle: OtpFieldStyle.circle,
          onOtpEntered: (otp) {
            print('Entered OTP: $otp');
            if (otp == "23456") {
              Navigator.pushNamed(context, "/home");
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
            }
          },
        ),
       // check if seconds == 0, show the user a button for request again
        Text("$seconds seconds to request again!"),
      ],
    );
  }
}