import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Flex(
            direction: Axis.vertical,
            children: [
              _buildCard(
                children: [
                  const Text('Cart Summary',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  _duoInfo('SubTotal (4 items)', 'Rs. 7,090.00'),
                  _duoInfo('Promotion Discounts', 'Rs. 300.00'),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Add coupon'),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: _textField(''),
                      ),
                    ],
                  ),
                  _duoInfo('Delivery Chanrges', 'Rs. 0.00'),
                  _duoInfo('Est. Total', 'Rs. 6,790.00', isTotal: true),
                ],
              ),
              const SizedBox(height: 20),
              _buildCard(
                children: [
                  const Text('Recipient Details',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  _textField('Ishan Madushka'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: DropdownButtonFormField(
                          value: '+94',
                          items: const [
                            DropdownMenuItem(value: '+94', child: Text('+94')),
                            DropdownMenuItem(value: '+80', child: Text('+80')),
                            DropdownMenuItem(value: '+10', child: Text('+10')),
                          ],
                          onChanged: (value) {},
                          alignment: Alignment.center,
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Colors.grey.shade200),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: _textField('71 87 86 729'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildCard(
                children: [
                  const Text('Delivery Information',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.green.shade100),
                          foregroundColor:
                          MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2))),

                        ),
                        onPressed: () {},
                        child: const Text('Home Delivery'),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                          MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width / 2 - 40, 40)),
                        ),
                        onPressed: () {},
                        child: const Text('Pick Up',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _textField('424/1D Palanwatta, Pannipitiya',
                      enableSuffix: true),
                ],
              ),
              const SizedBox(height: 20),
              _buildCard(children: [
                const Text('Delivery Date',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Row(),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(String hint, {bool enableSuffix = false}) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        suffixIcon: !enableSuffix
            ? null
            : Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.grey.shade200)),
          ),
          child: const Icon(Icons.location_on, color: Colors.grey),
        ),
      ),
    );
  }

  Row _duoInfo(String title, String result, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 18 : 16)),
        Text(result,
            style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 18 : 16)),
      ],
    );
  }

  Container _buildCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
