import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List _UserTransaction;
  final Function _deleteTransaction;

  TransactionList(this._UserTransaction, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _UserTransaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction adding yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/zzz.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              '\$${_UserTransaction[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _UserTransaction[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_UserTransaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                      ),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>
                          _deleteTransaction(_UserTransaction[index].id),
                    ),
                  ),
                );
              },
              itemCount: _UserTransaction.length,
            ),
    );
  }
}
