import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../../core/widgets/action_button_widget.dart';
import 'pet_form.dart';
import 'tutor_form.dart';

class AddPetForm extends StatelessWidget {
  final VoidCallback? onInsertPhoto;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  const AddPetForm({
    Key? key,
    this.onInsertPhoto,
    this.onSave,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Adicionar Pet',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(thickness: 1.0),
            const SizedBox(height: 16.0),
            const TabBar(
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Pet'),
                Tab(text: 'Tutor'),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TabBarView(
                children: [
                  PetForm(onInsertPhoto: onInsertPhoto),
                  const TutorForm(),
                ],
              ),
            ),
            const Divider(thickness: 1.0),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  text: 'Cancelar',
                  onPressed: onCancel ??
                      () {
                        Navigator.of(context).pop();
                      },
                  borderColor: Colors.purple,
                  textColor: Colors.purple,
                  buttonColor: Colors.white,
                  fontSize: 16.0,
                  borderRadius: 5,
                  width: 130,
                ),
                ActionButton(
                  text: 'Salvar',
                  width: 130,
                  onPressed: onSave ?? () {},
                  borderColor: Colors.purple,
                  textColor: Colors.white,
                  buttonColor: Colors.purple,
                  fontSize: 16.0,
                  borderRadius: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
