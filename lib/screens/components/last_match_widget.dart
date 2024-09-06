import 'package:carousel/models/match_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        tileColor: Theme.of(context).highlightColor,
        title: Row(
          children: [
            const Text('Kny'),
            const SizedBox(width: 4),
            Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
                child: Image.asset(
                  'assets/images/kenya.png',
                  width: 20,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 2),
            const Text('0'),
            const SizedBox(width: 2),
            const Text('0'),
            const SizedBox(width: 4),
            Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
                child: Image.asset(
                  'assets/images/zimbabwe.png',
                  width: 20,
                  fit: BoxFit.contain,
                )),
            const SizedBox(width: 2),
            const Text('Zbw'),
          ],
        ),
        trailing: Text(
          widget.transaction.amount,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
