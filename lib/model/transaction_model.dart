class TransactionModel {
  String name;
  String photo;
  String date;
  String amount;

  TransactionModel(this.name, this.photo, this.date, this.amount);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(
        item['name'], item['photo'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "Alex Car Services",
    "photo": "assets/images/user_photo.png",
    "date": "4.1 / 5",
    "amount": "35km "
  },
  {
    "name": "Pan Car Services ",
    "photo": "assets/images/user_photo.png",
    "date": "4.5 / 5",
    "amount": "2km "
  }
];
