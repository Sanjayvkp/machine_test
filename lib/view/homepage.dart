import 'package:flutter/material.dart';
import 'package:flutter_machine_test/provider/api_provider_riverpod.dart';
import 'package:flutter_machine_test/view/logout_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API Details'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogoutPage(),
                      ));
                },
                icon: const Icon(
                  Icons.login,
                  color: Colors.black,
                ))
          ],
        ),
        body: ref.watch(apiProvider).when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 380,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color:
                                              Color.fromARGB(255, 48, 48, 48))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              child: Text(
                                                  data[index].id.toString())),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: 250,
                                            child: Text(
                                              data[index].title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.amber),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Text(
                                          data[index].body,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text('Error'),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
