import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/core/widgets/action_button_widget.dart';
import 'package:guarda_digital_flutter/styles.dart';

class ExecutorForm extends StatelessWidget {
  final String? title;
  final String? firstNameLabel;
  final String? secondNameLabel;
  final String? lastNameLabel;
  final String? emailLabel;
  final String? birthDateLabel;
  final Icon? birthDateIcon;
  final String? phoneLabel;
  final String? insertPhotoLabel;
  final Color? insertPhotoColor;
  final Color? insertPhotoTextColor;
  final VoidCallback? onInsertPhoto;
  final String? cancelButtonText;
  final String? saveButtonText;
  final Color? cancelButtonColor;
  final Color? cancelButtonTextColor;
  final Color? saveButtonColor;
  final Color? saveButtonTextColor;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  // New dropdown parameters
  final String? dropdownLabel;
  final List<String>? dropdownItems;
  final String? selectedDropdownItem;
  final ValueChanged<String?>? onDropdownChanged;

  const ExecutorForm({
    Key? key,
    this.title,
    this.firstNameLabel,
    this.secondNameLabel,
    this.lastNameLabel,
    this.emailLabel,
    this.birthDateLabel,
    this.birthDateIcon,
    this.phoneLabel,
    this.insertPhotoLabel,
    this.insertPhotoColor,
    this.insertPhotoTextColor,
    this.onInsertPhoto,
    this.cancelButtonText,
    this.saveButtonText,
    this.cancelButtonColor,
    this.cancelButtonTextColor,
    this.saveButtonColor,
    this.saveButtonTextColor,
    this.onSave,
    this.onCancel,
    // New dropdown parameters
    this.dropdownLabel,
    this.dropdownItems,
    this.selectedDropdownItem,
    this.onDropdownChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
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
          if (dropdownLabel != null && dropdownItems != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dropdownLabel!,
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  value: selectedDropdownItem,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.pink),
                    ),
                  ),
                  items: dropdownItems!.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: onDropdownChanged,
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          if (birthDateLabel != null)
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: birthDateLabel,
                    prefixIcon:
                        birthDateIcon ?? const Icon(Icons.calendar_today),
                    labelStyle: const TextStyle(color: Colors.black87),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.pink),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 12.0),
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          // Instruções TextField
          TextField(
            decoration: InputDecoration(
              labelText: 'Instruções',
              labelStyle: const TextStyle(color: Colors.black87),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.pink),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.file_upload_outlined, color: AppColors.primary),
                label: const Text('Procurar no dispositivo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  minimumSize: const Size(150, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  side: const BorderSide(color: AppColors.primary),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                label: const Text('Tirar foto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Divider(thickness: 1.0),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (cancelButtonText != null)
                ActionButton(
                  text: cancelButtonText!,
                  onPressed: onCancel ??
                      () {
                        Navigator.of(context).pop();
                      },
                  borderColor: cancelButtonColor ?? Colors.purple,
                  textColor: cancelButtonTextColor ?? Colors.purple,
                  buttonColor: Colors.white,
                  fontSize: 16.0,
                  borderRadius: 5,
                ),
              if (saveButtonText != null)
                ActionButton(
                  text: saveButtonText!,
                  onPressed: onSave ?? () {},
                  borderColor: saveButtonColor ?? Colors.purple,
                  textColor: saveButtonTextColor ?? Colors.white,
                  buttonColor: saveButtonColor ?? Colors.purple,
                  fontSize: 16.0,
                  borderRadius: 5,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
