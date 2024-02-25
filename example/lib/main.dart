import 'package:flutter/material.dart';
import 'package:list_with_categories/list_with_categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ListScrollController controller;
  late ListScrollListener listScrollListener;

  final List<String> animals = [
    'Aardvark',
    'Baboon',
    'Cheetah',
    'Dolphin',
    'Elephant',
    'Flamingo',
    'Giraffe',
    'Hippopotamus',
    'Iguana',
    'Jaguar',
    'Koala',
    'Lion',
    'Meerkat',
    'Narwhal',
    'Ocelot',
    'Panda',
    'Quokka',
    'Raccoon',
    'Sloth',
    'Tiger',
    'Umbrellabird',
    'Vulture',
    'Wallaby',
    'Xerus',
    'Yak',
    'Zebra',
    'Antelope',
    'Buffalo',
    'Cougar',
    'Duck',
    'Eagle',
    'Falcon',
    'Gorilla',
    'Hyena',
    'Impala',
    'Jackal',
    'Kangaroo',
    'Lemur',
    'Mongoose',
    'Numbat',
  ];

  @override
  void initState() {
    controller = ListScrollController();
    listScrollListener = ListScrollListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animals.sort((a, b) => a.compareTo(b));
    final cats = animals.map((e) => e[0].toUpperCase()).toSet().toList();
    final Map<String, List<String>> groupedBrands = {};
    for (final letter in cats) {
      groupedBrands[letter] =
          animals.where((e) => e.toUpperCase().startsWith(letter)).toList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("List with Cats Example"),
      ),
      body: ListViewWithCategories(
          controller: controller,
          scrollListener: listScrollListener,
          itemsLength: cats.length,
          itemBuilder: (_, index) {
            final sectionLetter = cats[index];
            final animal = groupedBrands[sectionLetter] ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    sectionLetter,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...animal.map(
                  (e) => ListTile(
                    title: Text(e),
                  ),
                )
              ],
            );
          },
          categoryBuilder: (_, index) {
            return InkWell(
                onTap: () {
                  controller.scrollTo(
                      index: index,
                      duration: const Duration(milliseconds: 200));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cats[index]),
                ));
          }),
    );
  }
}
