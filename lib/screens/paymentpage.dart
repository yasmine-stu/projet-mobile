import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF25C1C1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFD9F6F6),
                    ),
                    /*
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/logo2.png',
                        ),
                        const Text(
                          'BringMe',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'News',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Log out',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    */
                  ),
                  SizedBox(height: size.width * 0.05),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0x9F127979),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Text(
                        'Payment form',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.05),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.06, vertical: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9F6F6),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              'TO BE PAID 3\$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          SizedBox(height: size.width * 0.05),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Email',
                                fillColor: const Color(0xFFD9F6F6),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                          SizedBox(height: size.width * 0.05),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Phone',
                                fillColor: const Color(0xFFD9F6F6),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                          SizedBox(height: size.width * 0.05),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Country',
                                fillColor: const Color(0xFFD9F6F6),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                          SizedBox(height: size.width * 0.05),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Card Number',
                                fillColor: const Color(0xFFD9F6F6),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                          SizedBox(height: size.width * 0.05),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Verification Code',
                                fillColor: const Color(0xFFD9F6F6),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                          SizedBox(height: size.width * 0.05),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                              color: const Color(0x9F127979),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'pay',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Align(alignment: Alignment.bottomLeft, child: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
