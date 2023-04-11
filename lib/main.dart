import 'package:flutter/material.dart';

class NewNavBar extends StatelessWidget {
  final List<IconData> navBarIcons;

  NewNavBar(this.navBarIcons);

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.green,
      backgroundColor: Colors.green,
      items: List.generate(navBarIcons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(navBarIcons[index]),
          label: "Voltar",
        );
      }),
    );
  }
}

class MyBodyContent extends StatelessWidget {
  const MyBodyContent();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Tapete para sala R\$34,99",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 51),
        ),
        Text(
          "Toalha de mesa florida por R\$49,99",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 51),
        ),
        Text(
          "Kit toalhas corpo/rosto R\$59,00",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 51),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp();

  final navBarIcons = [
    Icons.arrow_back,
    Icons.house,
    Icons.table_bar,
    Icons.bathtub,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text(
              "Decoração",
              style: TextStyle(color: Colors.white),
            ),
            alignment: Alignment.center,
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.withOpacity(0.8),
                Colors.green.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            image: DecorationImage(
              image: NetworkImage(
                "https://i.imgur.com/QCDr6gq.jpeg",
              ),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: Center(
            child: MyBodyContent(),
          ),
        ),
        bottomNavigationBar: NewNavBar(navBarIcons),
        bottomSheet: Container(
          color: Colors.lightGreen,
          padding: EdgeInsets.all(16),
          child: Text(
            "Nova coleção chegando em breve!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
