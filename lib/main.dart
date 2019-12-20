import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

main() {
  runApp(MyApp());
}

class Myt App extends StatelessWidget {
  HasuraConnect hasuraConnect =
      HasuraConnect("https://hasura.tradeplan.io/v1/graphql");

  @override
  Widget build(BuildContext context) {
    runHasuraQuery();
    return Container();
  }

  Future runHasuraQuery() async {
    String screenerQuery = """
query{
  screeners {
    name
    id
  }
}
    """;
    Map<String, dynamic> r = await hasuraConnect.query(screenerQuery);
    Map<String, dynamic> dataMap = r['data'];
    List<Map<String, dynamic>> screenerList =
        List.castFrom(dataMap['screeners']);
    screenerList.forEach((screener) {
      print(screener['name']);
    });
  }
}