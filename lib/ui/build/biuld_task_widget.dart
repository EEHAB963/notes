import 'package:flutter/material.dart';
import 'package:note/provider/taske_provider.dart';
import 'package:note/ui/widgets/task_wedgit.dart';
import 'package:provider/provider.dart';

class BiuldTaskWidget extends StatelessWidget {
  const BiuldTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskeProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'tasks',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      provider.dataTask.length.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 4,
              child: Container(
                height: 100,
                child: provider.dataTask.length == null
                    ? const Center(
                        child: Text('NO Tasks'),
                      )
                    : ListView.builder(
                        itemCount: provider.dataTask.length,
                        itemBuilder: (context, index) => TaskWedget(
                          color: provider.checkbox == true
                              ? Colors.grey
                              : Colors.blue,
                          value: provider.checkbox,
                          onChanged: () {
                            print('build Chicbox');
                            provider.valueCheckbox();
                          },
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
