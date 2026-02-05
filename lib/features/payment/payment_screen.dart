import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/features/payment/widgets/payment_method_title.dart';

import '../../core/constants/colors.dart';
import '../cart/cubit/cart_cubit.dart';
import 'cubit/payment_cubit.dart';
import 'cubit/payment_state.dart';

import 'widgets/order_summary.dart';
import 'widgets/confirm_payment_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = context.read<CartCubit>().getTotal();

    return BlocProvider(
      create: (_) => PaymentCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text("Payment"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Payment Successful 🎉"),
                  ),
                );

                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              final selected =
                  (state as PaymentMethodSelected).method;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Choose Payment Method",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  PaymentMethodTile(
                    title: "Cash on Delivery",
                    selected: selected == "Cash",
                    onTap: () {
                      context
                          .read<PaymentCubit>()
                          .selectMethod("Cash");
                    },
                  ),

                  PaymentMethodTile(
                    title: "Credit Card",
                    selected: selected == "Card",
                    onTap: () {
                      context
                          .read<PaymentCubit>()
                          .selectMethod("Card");
                    },
                  ),

                  PaymentMethodTile(
                    title: "PayPal",
                    selected: selected == "PayPal",
                    onTap: () {
                      context
                          .read<PaymentCubit>()
                          .selectMethod("PayPal");
                    },
                  ),

                  const Spacer(),

                  OrderSummary(total: total),

                  const SizedBox(height: 15),

                  ConfirmPaymentButton(
                    onPressed: () {
                      context
                          .read<PaymentCubit>()
                          .confirmPayment();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
