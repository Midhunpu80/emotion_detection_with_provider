import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:youtbe/controller/procontroller.dart';
import 'package:youtbe/service/service.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<procontrolller>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.draw,
          color: Colors.white,
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: const Text(
          "Emotion detection ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<procontrolller>(builder: (context, values, _) {
        return ListView(
          children: [
            Container(
              height: 200,
              width: 500,
              color: Colors.amber,
              child: values.images != null
                  ? Image.file(
                      File(values.images!.path),
                      fit: BoxFit.cover,
                    )
                  : SizedBox(),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  values.imageacces(ImageSource.gallery);

                  // values.imageacces(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                label: const Text("pick")),
            ElevatedButton.icon(
                onPressed: () async {
                  //  File imageFile = File(values.images!.path);
                  if (values.images != null) {
                    await postimage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz4Y4q9Iq3EX8EdBslOjl3yTIbZQOsKmfkeQ&usqp=CAU");
                  }
                },
                icon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                label: const Text("post")),
            Container(
                height: 200,
                width: 300,
                color: Colors.red,
                child: Text(
                  lam.toString(),
                  style: TextStyle(fontSize: 35),
                ))
          ],
        );
      }),
    );
  }
}
