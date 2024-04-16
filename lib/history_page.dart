import 'package:flutter/material.dart';
import 'package:hubtel_coding/app_bar.dart';
import 'package:hubtel_coding/models.dart';
import 'package:hubtel_coding/transaction_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final history = [
    TransactionHistory(date: "May 24, 2022", transactions: [
      Transaction(
          time: "14:45Pm",
          name: "Emmanuel Rockson Kwabena Uncle Ebo",
          contact: "024 123 4567",
          favorite: true,
          amount: "500"),
      Transaction(
          time: "14:45Pm",
          name: "Absa",
          contact: "024 123 4567",
          amount: "500",
          status: TransactionStatus.failed)
    ]),
    TransactionHistory(date: "May 23, 2022", transactions: [
      Transaction(
          time: "14:45Pm",
          name: "Emmanuel Rockson Kwabena Uncle Ebo",
          contact: "024 123 4567",
          amount: "500"),
      Transaction(
          time: "14:45Pm",
          name: "Absa",
          contact: "024 123 4567",
          amount: "500",
          status: TransactionStatus.failed)
    ])
  ];

  bool showLoader = true;

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 1), () => setState(() => showLoader = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HistoryAppBar(),
      body: Column(
        children: [
          if (showLoader)
            const Expanded(
                child: Center(
              child: CircularProgressIndicator(),
            ))
          else
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemBuilder: (_, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: const Color(0xFFDEDEDE),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(history[i].date)),
                        const SizedBox(height: 10),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (_, k) {
                              return TransactionCard(
                                  transaction: history[i].transactions[k]);
                            },
                            separatorBuilder: (_, i) {
                              return const SizedBox(height: 10);
                            },
                            itemCount: history[i].transactions.length)
                      ],
                    );
                  },
                  separatorBuilder: (_, i) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: history.length),
            )
        ],
      ),
    );
  }
}
