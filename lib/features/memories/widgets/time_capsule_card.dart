import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/features/after_life/widgets/title_section.dart';

class TimeCapsuleCard extends StatelessWidget {
  const TimeCapsuleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSection(
                title: 'Cápsula do tempo',
                subtitle: 'Aqui fica todo o conteúdo da sua cápsula',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
