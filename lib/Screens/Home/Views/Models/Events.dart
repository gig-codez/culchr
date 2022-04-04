// ignore: file_names
class Events {
  final String title;
  final String image;

  Events({required this.title, required this.image});
}

/*  All */
final List data = [
  {'title': 'Nyege Nyege', 'image': 'images/events.jpg'},
  {'title': 'Nkuuka', 'image': 'images/culchrpass.jpg'},
  {'title': 'Kanivo', 'image': 'images/culchrwallet.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
];
List events = List.generate(
  data.length,
  (index) => Events(title: data[index]['title'], image: data[index]['image']),
);
/* Popular */
List popular = [
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
  {'title': 'Kanivo', 'image': 'images/experience.jpg'},
];
List pop = List.generate(
  popular.length,
  (index) =>
      Events(title: popular[index]['title'], image: popular[index]['image']),
);
/*  Nearby* */
List near = [
  {'title': 'Nkuuka', 'image': 'images/culchrpass.jpg'},
  {'title': 'Nkuuka', 'image': 'images/culchrpass.jpg'},
  {'title': 'Nkuuka', 'image': 'images/culchrpass.jpg'},
  {'title': 'Nkuuka', 'image': 'images/culchrpass.jpg'},
  {'title': 'Nkuuka', 'image': 'images/culchrpass.jpg'},
  {'title': 'Nkuuka', 'image': 'images/culchrpass.jpg'},
];
List n = List.generate(
  near.length,
  (index) => Events(title: near[index]['title'], image: near[index]['image']),
);
/* Recommended */
List rec = [
  {'title': 'Nyege Nyege', 'image': 'images/events.jpg'},
  {'title': 'Nyege Nyege', 'image': 'images/events.jpg'},
  {'title': 'Nyege Nyege', 'image': 'images/events.jpg'},
  {'title': 'Nyege Nyege', 'image': 'images/events.jpg'},
  {'title': 'Nyege Nyege', 'image': 'images/events.jpg'},
];
List r = List.generate(
  rec.length,
  (index) => Events(title: rec[index]['title'], image: rec[index]['image']),
);
