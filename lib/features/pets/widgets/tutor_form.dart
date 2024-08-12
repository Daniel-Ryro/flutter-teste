import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../../core/widgets/action_button_widget.dart';

class TutorForm extends StatelessWidget {
  final VoidCallback? onInsertPhoto;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;

  const TutorForm({
    Key? key,
    this.onInsertPhoto,
    this.onCancel,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'O que é o Tutor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Na sua falta coloque aqui o Nome do d\n'
          'O tutor é o indivíduo que exerce uma tutela, aquele que ampara, protege, \n'
          'guardiã do pet vai suprir e cuidar do pet na sua ausência',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Nome Tutor Pet',
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
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'E-mail',
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
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Telefone',
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
        ),
        const SizedBox(height: 16.0),
        ElevatedButton.icon(
          onPressed: onInsertPhoto ?? () {},
          icon: const Icon(Icons.file_upload_outlined, color: Colors.white),
          label: const Text(
            'Inserir foto tutor',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
