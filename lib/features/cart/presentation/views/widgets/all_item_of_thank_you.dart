import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/thank_you_item.dart';

class AllItemsOfThankYou extends StatefulWidget {
  const AllItemsOfThankYou({super.key});

  @override
  State<AllItemsOfThankYou> createState() => _AllItemsOfThankYouState();
}

class _AllItemsOfThankYouState extends State<AllItemsOfThankYou> {
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 42,
        ),
        ThankYouItem(text1: 'Date', text2: formattedDate),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ThankYouItem(text1: 'Time', text2: formattedTime),
        ),
        (FirebaseAuth.instance.currentUser!.providerData[0].providerId ==
                'google.com')
            ? ThankYouItem(
                text1: 'To',
                text2: FirebaseAuth.instance.currentUser!.displayName!,
              )
            : FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('usernames')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  return ThankYouItem(
                      text1: 'To', text2: snapshot.data?.data()!['name'] ?? '');
                },
              ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
