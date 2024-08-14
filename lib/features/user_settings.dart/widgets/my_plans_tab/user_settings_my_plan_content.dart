import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/core/widgets/generic_header.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_plans_tab/plan_summary_card.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_plans_tab/select_plan_card.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_plans_tab/subscription_details_card.dart';

import '../../../../styles.dart';

class UserSettingsMyPlan extends StatelessWidget {
  const UserSettingsMyPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GenericHeader(
                text: 'MEU PLANO',
                backgroundColor: AppColors.pink,
                onPressed: () {},
              ),
              SelectedPlanCard(
                planName: 'Plano Família',
                price: 29.90,
                nextBillingDate: DateTime(2024, 2, 9),
              ),
              SizedBox(height: 20.h),
              const Text(
                'Detalhes da Assinatura',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),
              SubscriptionDetailsCard(
                cardNumber: '6565',
                billingDate: DateTime(2024, 2, 9),
                onChangeCard: () {},
                onRenew: () {},
                onCancel: () {},
              ),
              SizedBox(height: 10.h),
              const Text(
                'Histórico pagamentos',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Column(
                children: [
                  PlanSummaryCard(
                    billingDate: DateTime(2024, 2, 9),
                    planName: 'Plano Premium',
                    cardNumber: '6565',
                    price: 29.00,
                  ),
                  SizedBox(height: 10.h),
                  PlanSummaryCard(
                    billingDate: DateTime(2024, 2, 9),
                    planName: 'Plano Premium',
                    cardNumber: '6565',
                    price: 29.00,
                  ),
                  SizedBox(height: 10.h),
                  PlanSummaryCard(
                    billingDate: DateTime(2024, 2, 9),
                    planName: 'Plano Premium',
                    cardNumber: '6565',
                    price: 29.00,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
