import 'package:flutter/material.dart';

import 'package:flutter_vict_app/src/domain/entity/profile_entity.dart';
import 'package:flutter_vict_app/src/screens/widgets/image_network_box_widget.dart';

class ProfileCardWidget extends StatelessWidget {
  final ProfileEntity profileEntity;

  const ProfileCardWidget({super.key, required this.profileEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 150,
                width: 150,
                child: ImageNetworkBoxWidget(imgUrl: profileEntity.avatar),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    profileEntity.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    profileEntity.email,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
