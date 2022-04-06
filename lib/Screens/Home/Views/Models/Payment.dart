class Payment {
  String? name;

  Payment({this.name});
}

List pay = [
  {'name': 'Paypal'},
  {'name': 'Mpesa'},
  {'name': 'Card'}
];
List py = List.generate(
  pay.length,
  (index) => Payment(
    name: pay[index]['name'],
  ),
);
