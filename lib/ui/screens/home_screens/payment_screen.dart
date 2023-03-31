import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lovelife/ui/themes/constants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay razorpay;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clear();
    razorpay.clear();
  }

  void _openCheckout() async {
    var options = {
      "key": "rzp_test_ig9UUAwgi3t0p5",
      "amount": num.parse(_controller.text) * 100,
      "name": "lovelife",
      'description': 'Payment for dating app subscription',
      'prefill': {
        'contact': '7592889247',
        'email': 'fousiyamajeed786@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Successful", textColor: Colors.green);
    print('Payment successful');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed", textColor: Colors.green);

    print('Payment error: ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External wallet selected: ${response.walletName}');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.pink,
            automaticallyImplyLeading: false,
            title: Text('Subscription Payment'),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: w10p * .6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Amount to pay',
                  ),
                ),
                InkWell(
                  onTap: () {
                    _openCheckout();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: h1p * 4),
                    child: buildButton(
                        height: h1p * 8,
                        width: w10p * 8.5,
                        title: "Pay",
                        filled: true),
                  ),
                )
              ],
            ),
          ));
    });
  }
}
