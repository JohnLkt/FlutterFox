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
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int tabsCount = 2;

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
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      text: 'Category 1',
                    ),
                    Tab(
                      text: 'Category 2',
                    ),
                  ],
                ),
              ),
            )),
        body: Container(
          alignment: Alignment.center,
          child: const Text('elements'),
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
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}
