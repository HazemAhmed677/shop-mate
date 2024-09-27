import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          left: false,
          right: false,
          child: Center(
            child: Text(
              'Profile',
              style: AppStyles.semiBoldInter16(context).copyWith(
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Center(
          child: CircleAvatar(
            radius: 52,
            backgroundImage:
                (FirebaseAuth.instance.currentUser!.providerData[0].photoURL !=
                        null)
                    ? CachedNetworkImageProvider(FirebaseAuth
                        .instance.currentUser!.providerData[0].photoURL!)
                    : const AssetImage(AppImages.noProfileImage),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Center(
          child:
              (FirebaseAuth.instance.currentUser!.providerData[0].providerId ==
                      'google.com')
                  ? Text(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style: AppStyles.regular24(context).copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      future: FirebaseFirestore.instance
                          .collection('usernames')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .get(),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data?.data()!['name'] ?? '',
                          style: AppStyles.regular24(context).copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
        ),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }
}
