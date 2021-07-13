import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/news_data_model.dart';
import 'package:task/provider/news_list_provider.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  _NewsHomeScreenState createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
//  late List<Data> listNewsData ;
//   late Future future;
//   bool isInit=true;
//
//   @override
//   void didChangeDependencies() {
//     if(isInit) {
//       future = Provider.of<NewsListProvider>(context, listen: false)
//           .fetchData().then((value) {
//         print(value);
//       });
//     }
//     isInit=false;
//     super.didChangeDependencies();
//   }
  var response;
  void fetch()async{
    response= await LoadData().load();
    print(response['data']);
  }
  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: response!=null?Card(
          margin: EdgeInsets.all(15),
          color: Colors.blue,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: height * 0.20,
            child: Row(
              children: [
                Container(
                  color: Colors.yellow,
                  height: height * 0.20,
                  width: width * 0.25,
                  child: InkWell(
                      onTap: () {},
                      child: Icon(Icons.favorite_border, size: 50)),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text('sdsd',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            'sdsd',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text('sdsd',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ):CircularProgressIndicator()
    );
  }
}
// onPressed: () async {
// await Provider.of<NewsListProvider>(context, listen: false)
// .fetchData()
//     .then((value){ response=value.data;});
//
// },
