import 'package:flutter/material.dart';
import 'package:hubtel_coding/models.dart';

// This widget represents a transaction card
class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFDEDEDE))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(transaction.time),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 120, child: Text(transaction.name)),
                          const SizedBox(height: 4),
                          Text(transaction.contact)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(transaction.status == TransactionStatus.success
                      ? "Successful"
                      : "failed"),
                  const SizedBox(height: 10),
                  Text("${transaction.currency} ${transaction.amount}")
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(),
                  const SizedBox(width: 10),
                  Text('Presonal'),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 4,
                  ),
                  const SizedBox(width: 10),
                  Text('${transaction.message}'),
                ],
              ),
              if (transaction.favorite)
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                )
            ],
          )
        ],
      ),
    );
  }
}
