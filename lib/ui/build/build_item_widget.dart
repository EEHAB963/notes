import 'package:flutter/material.dart';
import 'package:note/modil/model_db.dart';
import 'package:note/provider/home_provider.dart';
import 'package:note/ui/widgets/item_widget.dart';
import 'package:note/ui/widgets/item_widgets.dart';
import 'package:provider/provider.dart';

class BuildItemWidget extends StatelessWidget {
  const BuildItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return FutureBuilder<List<ModelDB>>(
          future: provider.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return provider.viwe == true
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: provider.data.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(
                          id: index,
                          text: provider.data[index].content,
                          onDs: (p0) {
                            provider.delete(index);
                          },
                          modelDB: provider.data[index],
                          numText: index + 1,
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: provider.data.length,
                      itemBuilder: (context, index) {
                        return ItimWidgetList(
                          onTap: () {
                            provider.id = provider.data[index].id;
                          },
                          text: provider.data[index].content,
                          onDs: (p0) {
                            provider.delete(index);
                          },
                          modelDB: provider.data[index],
                          numText: index + 1,
                        );
                      },
                    );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('NO NOte we'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}
