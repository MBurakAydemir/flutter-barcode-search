import 'package:barcode_search/future_search_example.dart';
import 'package:barcode_search/widgets/product_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarcodeSearch(),
    ),
  );

}
var veri;
getislemiyap(){
  http.get(Uri.https('https://jsonplaceholder.typicode.com', 'posts')).then((cevap){
    print(cevap.statusCode);
    print(cevap.body);

  });
  print("get çalışıyor");
}

postislemiyap(){

  print("post çalışıyor");
}
class BarcodeSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Search Application'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearch());
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: _button("Sol"),

          ),
          Align(
            alignment: Alignment.topCenter,
            child: _button("Orta"),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _button("Sağ"),
          ),
          ElevatedButton(
            child: Text('GELECEK arama örneği'),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FutureSearchExample())),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button("Sol"),
              _button("Orta"),
              _button("Sağ"),
            ],
          ),
          Container(
            height: 50,
            color: Colors.amber[000],
            child: const Center(child: Text('Merhaba, burası yazı yazma kısmı')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('İYİYİM SEN NASILSIN?')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                child: Text("GET"),

                    onPressed: getislemiyap,
              ), ),
              Expanded(
                child: ElevatedButton(
                  child: Text("POST"),

                  onPressed: postislemiyap,
                ), ),
            ],
          ),
          Container(
            height: 50,
            color: Colors.amber[000],
            child: const Center(child: Text('Gelen veri')),
          ),
        ],

      ),
    );
  }
}



Widget _button(text) => RaisedButton(onPressed: () {}, child: Text(text));

