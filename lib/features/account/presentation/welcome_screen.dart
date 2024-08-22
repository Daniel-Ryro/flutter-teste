// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart'; 
// import 'package:guarda_digital_flutter/features/account/presentation/logo_titile_section.dart';
// import '../../vault/widgets/vault_section.dart';
// import '../domain/usecases/get_account_data.dart';
// import 'actions_buttons.dart';
// import 'check_box_section.dart';
// import 'progress_indicator.dart';
// import 'package:guarda_digital_flutter/features/account/presentation/controllers/account_controller.dart';

// class WelcomeScreen extends StatelessWidget {
//   final String userName;

//   const WelcomeScreen({super.key, required this.userName});

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, designSize: const Size(375, 812));

//     // Registro do AccountController
//     final AccountController accountController = Get.put(AccountController(
//       getAccountData: Get.find<GetAccountData>(), // Certifique-se de que GetAccountData também está registrado
//     ));

//     accountController.loadAccountData(); // Carrega os dados do usuário ao iniciar a tela

//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F1FF),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(16.w),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 10.r,
//                         offset: Offset(0, 4.h),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       LogoTitleSection(userName: userName), // Passa o userName aqui
//                       const Divider(),
//                       SizedBox(height: 16.h),
//                       const VaultSection(
//                         svgPath: 'assets/icon/vault_ic.svg',
//                       ),
//                       SizedBox(height: 24.h),
//                       const ProgressIndicators(),
//                       SizedBox(height: 24.h),
//                       const CheckboxSection(),
//                       SizedBox(height: 16.h),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16.h),
//                 const ActionButtons(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
