import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

/**
 * Para testar essa página, alterar na main.dart a pagina product_detail para esta e
 * add ConterProvider em volta do MaterialApp.
 */
class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Contador'),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.inc();
              });
              print(CounterProvider.of(context)?.state.value);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider.of(context)?.state.dec();
              });
              print(CounterProvider.of(context)?.state.value);
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
