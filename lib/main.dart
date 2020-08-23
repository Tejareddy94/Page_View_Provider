import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: PageViewWidget(),
        ),
      ),
    );
  }
}

class PageViewController with ChangeNotifier {
  final List<Widget> pages = [Page1(), Page2(), Page3(), Page4(), Page5()];
  PageController _controller = PageController();
  double _page;
  double get page => _page;
  PageController get controller => _controller;
  PageViewController() {
    _controller.addListener(() {
      _page = _controller.page;
      notifyListeners();
    });
  }
}

class PageViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageViewController(),
      child: Consumer<PageViewController>(
        builder: (context, pageState, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < pageState.pages.length; i++)
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.all(2),
                      child: pageState._controller.hasClients
                          ? Container(
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: pageState._controller.page > i
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: Icon(
                                          Icons.check,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      )
                                    : (pageState._controller.page.toInt() == i)
                                        ? Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black,
                                            ),
                                            width: 30,
                                            height: 30,
                                          )
                                        : Container(
                                            width: 30,
                                            height: 30,
                                          ),
                              ),
                            )
                          : (!pageState._controller.hasClients && i == 0)
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                  width: 30,
                                  height: 30,
                                )
                              : Container(
                                  width: 30,
                                  height: 30,
                                ),
                    )
                ],
              ),
              Expanded(
                  child: PageView.builder(
                itemCount: pageState.pages.length,
                controller: pageState._controller,
                itemBuilder: (context, int index) {
                  return pageState.pages[index];
                },
              )),
            ],
          );
        },
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewController>(
      builder: (context, pageState, child) {
        return Container(
          child: Column(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.center, child: Text("Page 1"))),
              FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    pageState._controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: Text("Next"))
            ],
          ),
        );
      },
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewController>(
      builder: (context, pageState, child) {
        return Container(
          child: Column(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.center, child: Text("Page 2"))),
              FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    pageState._controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: Text("Next"))
            ],
          ),
        );
      },
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewController>(
      builder: (context, pageState, child) {
        return Container(
          child: Column(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.center, child: Text("Page 3"))),
              FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    pageState._controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: Text("Next"))
            ],
          ),
        );
      },
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewController>(
      builder: (context, pageState, child) {
        return Container(
          child: Column(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.center, child: Text("Page 4"))),
              FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    pageState._controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: Text("Next"))
            ],
          ),
        );
      },
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewController>(
      builder: (context, pageState, child) {
        return Container(
          child: Column(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.center, child: Text("Page 5"))),
              FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    pageState._controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: Text("Next"))
            ],
          ),
        );
      },
    );
  }
}
