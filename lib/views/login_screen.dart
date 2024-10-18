import 'package:flutter/material.dart';
import 'package:greenhouse/resources/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, color: AppColor.vividSkyBlue),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColor.vividSkyBlue,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 32,
                color: AppColor.vividSkyBlue,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,

              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Please, Enter your Phone number / Email to Sign In.",
              style: TextStyle(
                fontSize: 16,
                color: AppColor.oldSilver,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: AppColor.spanishGray,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
               enabledBorder:  OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.transparent),
                 borderRadius: BorderRadius.circular(6.0),
               ),
                suffixIcon: Icon(Icons.mail),
                filled: true,
                fillColor: AppColor.cultured,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: AppColor.spanishGray,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                suffixIcon: Icon(Icons.visibility_off),
                filled: true,
                fillColor: AppColor.cultured,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forget Password ?",
                style: TextStyle(
                  color: AppColor.vividSkyBlue,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mediumSkyBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                  color: Color(0xFF00BFFF),
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColor.linen,
                      side: BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      "GOOGLE",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColor.antiFlashWhite,
                      side: BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      "FACEBOOK",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don’t have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Register",
                      style: TextStyle(
                        color: Color(0xFF00BFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

}

