import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mpesa_integration/pages/info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mpesa-Integration'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello there,",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('How it works'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Here is a dummy application for Mpesa Integration. It is designed to enable users make charity donations to a mobile number provided in the platform. When a user clicks the 'donate' button, a screen is presented prompting the user to enter personal details and the amount to be donated. Upon submission, a push notification screen appears on the interface to enble the user key in his Secret PIN information to facilitate the transaction.  "),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Let's get Statrted!",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Click the Button Below to Get Started'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InfoPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Donate',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "poweredBy ",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
