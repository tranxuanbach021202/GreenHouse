import 'package:flutter/material.dart';
import 'package:greenhouse/resources/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // forgot password
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, color: AppColor.vividSkyBlue),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.vividSkyBlue,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),


            Text(
              "Create Account",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 32,
                color: Color(0xFF00BFFF),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // title
            Text(
              "Enter your details below to create an account.",
              style: TextStyle(
                fontSize: 18,
                color: AppColor.oldSilver,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30),

            // name
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(
                  color: AppColor.spanishGray,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(
                  color: AppColor.spanishGray,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // pass
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
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 20),

            // check tuan thu dieu khoan
            Row(
              children: [
                Checkbox(
                  value: _isAgreed,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                  },
                ),
                Text("I agree with "),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      color: Color(0xFF00BFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Button signup
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00BFFF), // Màu xanh nhạt
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OR text
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

            // google, facebook
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE0E0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFE0F7FA),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                ),
              ],
            ),
            const SizedBox(height: 30),

            // create login
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Color(0xFF00BFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}