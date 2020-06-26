import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _nList = List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _pushTeen();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[_makeList(), _makeLoading()],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _nList.clear();
    _lastItem = 0;
  }

  RefreshIndicator _makeList() => RefreshIndicator(
        onRefresh: _getPageOne,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _nList.length,
          itemBuilder: (BuildContext cont, int index) {
            return FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${_nList[index]}/500/300.jpg'));
          },
        ),
      );

  Widget _makeLoading() {
    return _isLoading
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
              Divider(
                height: 20,
                endIndent: 1000,
                indent: 1000,
              )
            ],
          )
        : Container();
  }

  void _pushTeen() {
    for (var i = 0; i < 10; i++, _lastItem++) {
      _nList.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final _duration = Duration(seconds: 2);
    return Timer(_duration, responseHTTP);
  }

  Future<void> _getPageOne() async {
    final Duration dur = Duration(seconds: 2);

    Timer(dur, () {
      _nList.clear();
      _lastItem++;
      _pushTeen();
    });
    return Future.delayed(dur);
  }

  void responseHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);

    _pushTeen();
  }
}
