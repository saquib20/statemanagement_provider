import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'listprovider.dart';

class Second extends StatefulWidget {
  const Second({
    super.key,
  });

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: ((context, NumbersProviderModel, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NumbersProviderModel.add();
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(),
          body: SizedBox(
            child: Container(
              child: Column(
                children: [
                  Text(
                    NumbersProviderModel.numbers.last.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: NumbersProviderModel.numbers.length,
                      itemBuilder: (context, index) {
                        return Text(
                          NumbersProviderModel.numbers[index].toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
