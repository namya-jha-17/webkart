import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayIntegration{

  final Razorpay _razorpay = Razorpay();
  initiateRazorPay() {
// To handle different event with previous functions
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
print(("payment done"));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(("payment fail"));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
// Do something when an external wallet is selected


  }


}