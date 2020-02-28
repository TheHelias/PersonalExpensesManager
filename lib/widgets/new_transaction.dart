import 'package:flutter/material.dart';
import 'package:flutter_basics/models/transaction.dart';
import 'package:path_provider/path_provider.dart';


class NewTransaction extends StatelessWidget {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final Function addTransaction;
  final List<Transaction> transations;

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory.path);
  return directory.path;
}

  NewTransaction(this.addTransaction, this.transations);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed: () => addTransaction(
                    titleController.text, double.parse(amountController.text)),
                onLongPress: () => _localPath,
              )
            ]),
      ),
    );
  }
}
