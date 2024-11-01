import 'package:flutter/material.dart';
import 'package:greenhouse/views/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:greenhouse/viewmodels/otp_viewmodel.dart';

import '../resources/color.dart';
import 'package:logger/logger.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}
class _OtpScreenState extends State<OtpScreen> {

  final viewModel = OtpViewModel();

  var logger = Logger();

  void someFunction(String e) {
    logger.e(e);
  }

  void _handleVerifyOtp() async {
    try {
      someFunction("tessstttt1");
      String otpCode = _otpControllers.map((controller) => controller.text).join();
      if (otpCode.length == 4) {
        someFunction("tessstttt2");
        final response = await viewModel.verifyOtp(widget.email, otpCode);
        if (response == true) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text('Email verified successfully')),
          // );

          someFunction("tessstttt3");

          await Future.delayed(Duration(seconds: 1));


          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,); // false để xóa tất cả các màn hình trong stack
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failed')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }


  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OtpViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login to GreenHouse",
        style: TextStyle(
        fontSize: 18,
        color: AppColor.vividSkyBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.vividSkyBlue),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Verify Phone Number",
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.vividSkyBlue,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the 4-Digit code that we've sent you at email",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.oldSilver,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                        viewModel.updateOtp(_otpControllers.map((c) => c.text).join());
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 30),
              viewModel.isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _handleVerifyOtp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.vividSkyBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                },
                child: Text(
                  "Didn't receive code? Resend Again.",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
