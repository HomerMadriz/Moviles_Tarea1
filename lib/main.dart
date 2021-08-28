import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mailClicked = false;
  bool callClicked = false;
  bool routeClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App ITESO'),
        ),
        body: Container(
          child: ListView(
            children: [
              Image.network(
                  'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ITESO, Universidad Jesuita de Guadalajara',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('San Pedro Tlaquepaque, Jal.',
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  UpdateLikesCounter()
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        onPressed: () {
                          if (!mailClicked) {
                            final snackBar = SnackBar(
                              content: const Text('Sending email...'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          setState(() {
                            mailClicked = !mailClicked;
                          });
                        },
                        icon: Icon(
                          Icons.mail,
                          size: 44,
                          color: mailClicked ? Colors.indigo : Colors.black,
                        ),
                      ),
                      Text('Correo')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          onPressed: () {
                            if (!callClicked) {
                              final snackBar =
                                  SnackBar(content: const Text('Calling...'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            setState(() {
                              callClicked = !callClicked;
                            });
                          },
                          icon: Icon(
                            Icons.call,
                            size: 44,
                            color: callClicked ? Colors.indigo : Colors.black,
                          )),
                      Text('Llamada')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                          onPressed: () {
                            if (!routeClicked) {
                              final snackBar =
                                  SnackBar(content: const Text('Searching...'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            setState(() {
                              routeClicked = !routeClicked;
                            });
                          },
                          icon: Icon(Icons.directions,
                              size: 44,
                              color:
                                  routeClicked ? Colors.indigo : Colors.black)),
                      Text('Ruta')
                    ],
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Text(
                'El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.',
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ));
  }
}

// Codigo extraido de https://flutter-examples.com/change-text-widget-text-dynamically/
class UpdateLikesCounter extends StatefulWidget {
  UpdateTextState createState() => UpdateTextState();
}

class UpdateTextState extends State {
  String textHolder = '0';
  int counter = 0;

  changeText(str) {
    setState(() {
      textHolder = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            counter++;
            changeText(counter.toString());
          },
          icon: Icon(Icons.thumb_up),
        ),
        IconButton(
            onPressed: () {
              counter--;
              changeText(counter.toString());
            },
            icon: Icon(Icons.thumb_down)),
        Text('$textHolder')
      ],
    );
  }
}
