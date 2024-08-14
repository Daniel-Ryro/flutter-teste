import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/core/widgets/generic_header.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/contact_tab/contact_card.dart';

import '../../../../core/widgets/info_card.dart';
import '../../../../styles.dart';
import '../../data/models.dart';

class UserSettingsContact extends StatelessWidget {
  const UserSettingsContact({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(
        name: 'Alberto Hernandes',
        email: 'alberto@gmail.com',
        imagePath:
            'assets/img/parents-with-their-children-walking-forest 1.png',
        icons: [Icons.person],
      ),
      Contact(
        name: 'Alba Junior',
        email: 'alba@gmail.com',
        imagePath:
            'assets/img/parents-with-their-children-walking-forest 1.png',
        icons: [Icons.person, Icons.pets],
      ),
      Contact(
        name: 'Carlos Silva',
        email: 'carlos@gmail.com',
        imagePath:
            'assets/img/parents-with-their-children-walking-forest 1.png',
        icons: [Icons.person],
      ),
      Contact(
        name: 'Yuri Hernandes',
        email: 'alberto@gmail.com',
        imagePath:
            'assets/img/parents-with-their-children-walking-forest 1.png',
        icons: [Icons.person],
      ),
      Contact(
        name: 'Bruno Hernandes',
        email: 'alberto@gmail.com',
        imagePath:
            'assets/img/parents-with-their-children-walking-forest 1.png',
        icons: [Icons.person],
      ),
    ];

    contacts.sort((a, b) => a.name.compareTo(b.name));

    Map<String, List<Contact>> groupedContacts = {};
    for (var contact in contacts) {
      String firstLetter = contact.name[0].toUpperCase();
      if (!groupedContacts.containsKey(firstLetter)) {
        groupedContacts[firstLetter] = [];
      }
      groupedContacts[firstLetter]!.add(contact);
    }

    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GenericHeader(
                text: 'LISTA DE CONTATOS',
                backgroundColor: AppColors.pink,
                onPressed: () {},
              ),
              const InfoCard(
                title: 'Lista de Contatos',
                description:
                    'Seus contatos adicionados no Guarda todos em um mesmo lugar',
              ),
              SizedBox(height: 20.h),
              ...groupedContacts.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    ...entry.value.map((contact) {
                      return ContactCard(
                        name: contact.name,
                        email: contact.email,
                        imagePath: contact.imagePath,
                        icons: contact.icons,
                      );
                    }),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
