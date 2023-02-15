import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FlutterFox ',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white70,
            ),
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyAppState extends ChangeNotifier {
  var categories = ['Category 1', 'Category 2', 'Category 3', 'Category 4'];
  final lastUpdate = DateTime.utc(2023, 0, 1);
  var updateData = ['test1', 'test2'];
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const LibraryPage(),
    const UpdatesPage(),
    const Text(
      'Index 2: Business',
    ),
    const Text(
      'Index 3: School',
    ),
    const Text(
      'Index 4: Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    int tabsCount = appState.categories.length;

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Library'),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'search',
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.filter_list_rounded),
                tooltip: 'filter, sort, display',
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                tooltip: 'more options',
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  tabs: <Widget>[
                    for (var category in appState.categories)
                      Tab(
                        text: category.toString(),
                      ),
                  ],
                ),
              ),
            )),
        body: TabBarView(
          children: <Widget>[
            for (var category in appState.categories)
              Center(
                child: Text(category.toString()),
              ),
          ],
        ),
      ),
    );
  }
}

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    int lastUpdateNum = 5;
    var lastUpdateUnit = 'Hours';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Updates'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'refresh',
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text('Library last updated: $lastUpdateNum $lastUpdateUnit ago'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Today',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (var manga in appState.updateData)
              Card(
                child: ListTile(
                  leading: const FlutterLogo(),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(manga),
                      Text('chapter - chapterTitle'),
                    ],
                  ),
                  trailing: const Icon(Icons.download_for_offline_rounded),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Yesterday',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Last week',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Long Ago',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
