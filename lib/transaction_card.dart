import 'package:flutter/material.dart';
import 'package:hubtel_coding/models.dart';

// This widget represents a transaction card
class TransactionCard extends StatefulWidget {
  const TransactionCard({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  double mininAmountHeight = 0;

  final myKey = GlobalKey();

  bool hasCalculated = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => doCalculation());

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFDEDEDE))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.transaction.time),
          const SizedBox(height: 10),
          Row(
            key: myKey,
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
                          SizedBox(
                              width: 120, child: Text(widget.transaction.name)),
                          const SizedBox(height: 4),
                          Text(widget.transaction.contact)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(minHeight: mininAmountHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.transaction.status == TransactionStatus.success
                        ? "Successful"
                        : "failed"),
                    const SizedBox(height: 10),
                    Text(
                        "${widget.transaction.currency} ${widget.transaction.amount}")
                  ],
                ),
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
                  Text('${widget.transaction.message}'),
                ],
              ),
              if (widget.transaction.favorite)
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

  void doCalculation() {
    if (hasCalculated) return;

    final height = myKey.currentContext?.size?.height;

    setState(() {
      hasCalculated = true;
      mininAmountHeight = height ?? 0;
    });
  }
}
