import 'package:flutter/material.dart';
import 'package:note/modil/model_task.dart';
import 'package:note/provider/taske_provider.dart';
import 'package:note/ui/widgets/task_wedgit.dart';
import 'package:provider/provider.dart';

import '../screens/contant_task.dart';

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
                child: FutureBuilder<List<ModelTask>>(
                  future: provider.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 2,
                        // provider.dataTask.length,
                        itemBuilder: (context, index) => TaskWedget(
                          modelTask: provider.dataTask[index],
                          onChanged: () {
                            print('build Chicbox');
                            provider.valueCheckbox();
                          },
                          onTap: () {
                            provider.on = true;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContantTask(
                                    modelTask: provider.dataTask[index],
                                  ),
                                ));
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('NO Tasks'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
