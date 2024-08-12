import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'form_section_title.dart';

class PetForm extends StatelessWidget {
  final VoidCallback? onInsertPhoto;

  const PetForm({Key? key, this.onInsertPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Nome Pet',
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
            'Inserir foto do PET',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pink,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Especie',
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
        TextField(
          decoration: InputDecoration(
            labelText: 'Raça',
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
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Mensagem',
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
        const FormSectionTitle(
          title: 'Inserir documentos do pet',
          subtitle: 'Documento e vacinas do PET',
        ),
        const SizedBox(height: 16.0),
        ElevatedButton.icon(
          onPressed: () {
            // Ação para inserir documentos
          },
          icon: const Icon(Icons.file_upload_outlined, color: Colors.white),
          label: const Text(
            'Procurar Arquivo',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pink,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
        ),
      ],
    );
  }
}
