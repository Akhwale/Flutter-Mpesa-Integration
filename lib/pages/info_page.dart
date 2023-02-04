import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Future<void> lipaNaMpesa(String phone, String amount) async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: "174379",
              transactionType: TransactionType.CustomerPayBillOnline,
              amount: "${amountController.text}",
              partyA: phoneController.text,
              partyB: "174379",
//Lipa na Mpesa Online ShortCode
              callBackURL: Uri(
                  scheme: "https",
                  host: "mpesa-requestbin.herokuapp.com",
                  path: "/1hhy6391"),
//This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
              accountReference: "Donate to Save a child KE",
              phoneNumber: phoneController.text,
              baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
              transactionDesc: "Donation",
              passKey:
                  "pmeLdSk+XAh8M2iVblaOP8isomqbD/heHT5rFWzP1sZQJx258XzLxYbXpPZViXtteWwTlTuXyumnOpX4+UYXtAkwA5HhPToiXlhYlyC/s0bauAFOsvSC1XMNJx889fPWIPDYyVe6kNnXfUyFIkLCVPVQKeIZhVjfEJlmszsTzjk3s+Pmy+lHRR23YXG72/VPaF4vdS6L1oiEHS3N0FTKDUMGAg7k15Yt47oMcFJWko4i4MsY8vfvZCSQh/xBuOOv6fJHv4IDjKYo+9eUTBJJC3Mq3ClFolXkFCrmDJTyEdfPiOZCIKLxXTRjEouGzGlF4zRWoG0/VorkgpCpAEtcHg==");
//This passkey has been generated from Test Credentials from Safaricom Portal

      return transactionInitialisation;
    } catch (e) {
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }

//Text Controllers
  final fullNameController = TextEditingController();
  final nationalityController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final amountController = TextEditingController();

  @override

//Disposing Controllers
  void dispose() {
    fullNameController.dispose();
    nationalityController.dispose();
    ageController.dispose();
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mpesa-Integration"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Once Again,",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Please Enter your details Below to make your bountiful donation'),
                    SizedBox(
                      height: 20,
                    ),

                    // Text Fields

                    TextField(
                      controller: fullNameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextField(
                      controller: nationalityController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        border: OutlineInputBorder(),
                        labelText: 'Nationality',
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        helperText: 'In the Format 25470000000',
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (fullNameController.text != '' && amountController != '') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Proceed to Donate?'),
                        content: Text("Dear " +
                            fullNameController.text +
                            ', clicking "Yes" means that you are authorizing a transaction of Kshs. ' +
                            amountController.text +
                            '.00 from your M-Pesa Account. Do you wish to complete this transaction?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              lipaNaMpesa();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Invalid Action!'),
                        content: const Text(
                            'You can not Submit Empty fields in the previous screen. Fill in the fields correctly to continue.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Donate',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            SizedBox(
              height: 90,
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
