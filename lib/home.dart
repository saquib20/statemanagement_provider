import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_provider/listprovider.dart';
import 'package:statemanagement_provider/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: ((context, numbersProviderModel, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              numbersProviderModel.add();
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(),
          body: SizedBox(
            child: Container(
              child: Column(
                children: [
                  Text(
                    numbersProviderModel.numbers.last.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: numbersProviderModel.numbers.length,
                      itemBuilder: (context, index) {
                        return Text(
                          numbersProviderModel.numbers[index].toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Second(),
                      ));
                    },
                    child: const Text("Go to Next"),
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}
