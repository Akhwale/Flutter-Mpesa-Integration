import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
                      maxLength: 10,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        helperText: 'In the Format 070000000',
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
                            onPressed: () => Navigator.pop(context, 'OK'),
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
