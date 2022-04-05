// ignore: file_names
class Tickets {
  final String name;
  final String price;

  String description;
  Tickets({required this.name, required this.description, required this.price});
}

List ticks = [
  {
    'name': 'Early Bird ',
    'price': '20000',
    'desc': 'Long press for ticket details'
  },
  {
    'name': 'Standard',
    'price': '50,000',
    'desc': 'Long press for ticket details'
  },
  {'name': 'VIP', 'price': '100,000', 'desc': 'Long press for ticket details'},
  {
    'name': 'Exclusive',
    'price': '200,000',
    'desc': 'Long press for ticket details'
  },
];
// tickets for all Events
List tickets = List.generate(
  ticks.length,
  (index) => Tickets(
    name: ticks[index]['name'],
    price: ticks[index]['price'],
    description: ticks[index]['desc'],
  ),
);
