import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchBarUI extends StatefulWidget {
  final Widget body;
  SearchBarUI({this.body});
  @override
  _SearchBarUIState createState() => _SearchBarUIState();
}

class _SearchBarUIState extends State<SearchBarUI> {
  static const historyLength = 5;
  String searchedTerm;
  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];

  List<String> filteredSearchHistory;
  String selectedTerm;
  List<dynamic> postsData = [];

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void seachHanlder(value) async {
    setState(() {
      addSearchTerm(value);
      selectedTerm = value;
      print('item has been searched2');
    });
    int findex = 0;
    int sindex = 1;
    String word = value.toString().substring(findex, sindex);
    try {
      dynamic requestoptions = {
        'word': word,
      };
      var response = await Dio().post("http://localhost:8080/SearchBar",
          data: requestoptions,
          options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ));
      print("Check value before saved");
      postsData = response.data;
    } catch (err) {
      print(err);
    }
    controller.close();
  }

  List<dynamic> postData = [];
  void getPostData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      postData = prefs.getStringList('postsData');
    });
  }

  int index = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3),
      child: FloatingSearchBar(
        clearQueryOnClose: true,
        body: widget.body,
        automaticallyImplyDrawerHamburger: false,
        controller: controller,
        width: 800,
        height: 40,
        borderRadius: BorderRadius.circular(7),
        hint: 'Search.....',
        hintStyle: TextStyle(fontSize: 15),
        backgroundColor: Colors.white,
        openAxisAlignment: 0.0,
        axisAlignment: 0.0,
        scrollPadding: EdgeInsets.only(top: 20, bottom: 20),
        elevation: 4,
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          // return seachHanlder(query);
          query = query.toLowerCase();

          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
            postData = postData.where((desc) {
              return postData.contains(query);
            }).toList();
          });

          controller.close();
        },
        transitionCurve: Curves.easeInOut,
        transitionDuration: Duration(milliseconds: 300),
        debounceDelay: Duration(milliseconds: 300),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Material(
              color: Colors.white,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller.query.isEmpty) {
                    return Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Start searching',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchTerm(controller.query);
                          selectedTerm = controller.query;
                        });
                        controller.close();
                      },
                    );
                  } else {
                    return Container(
                      height: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 19, top: 12),
                                child: Text('Recent ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    )),
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: IconButton(
                                  hoverColor: Colors.grey,
                                  icon: Icon(
                                    Icons.delete_rounded,
                                    size: 20,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: filteredSearchHistory
                                  .map(
                                    (term) => ListTile(
                                      title: Text(
                                        term,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      leading: const Icon(Icons.history),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            deleteSearchTerm(term);
                                          });
                                        },
                                      ),
                                      onTap: () {
                                        setState(() {
                                          putSearchTermFirst(term);
                                          selectedTerm = term;
                                        });
                                        controller.close();
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64,
            ),
            Text(
              'Start searching',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }

    final fsb = FloatingSearchBar.of(context);

    return ListView(
      // padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
      children: List.generate(
        50,
        (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
