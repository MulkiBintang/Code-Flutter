import 'package:flutter/material.dart';
import 'package:test_flutter/datashop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.asset(
                "images/e-commerce.png",
                height: 200,
                width: 200,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> staticData = MyData.data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
          title: Text('Data Produk'),
          bottom: AppBar(
            title: Text(
              'Filter Produk',
              style: TextStyle(fontSize: 15),
            ),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              )
            ],
          ),
        ),
        body: ListView.separated(
          itemBuilder: (builder, index) {
            Map data = staticData[index];
            return ListTile(
              title: Text(
                "${data['barang']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: Text("Rp. ${data['harga']}"),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('${data['id']}')],
              ),
              trailing: Icon(Icons.delete, color: Colors.red),
            );
          },
          itemCount: staticData.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating button pressed');
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 239, 115, 106),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
      ),
    );
  }
}
