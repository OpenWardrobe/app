import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/lookbook.model.dart';
import 'package:openwardrobe/ui/widgets/lookbook/lookbook_component.dart';
import 'package:openwardrobe/ui/screens/lookbook/lookbook_controller.dart';

class LookbookView extends StatelessWidget {
  LookbookView({super.key});

  final LookbookController controller = LookbookController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lookbook'),
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: FutureBuilder<List<Lookbook>>(
                      future: controller.fetchLookbooks(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('No items found'));
                        } else {
                          final items = snapshot.data!;
                          return SingleChildScrollView(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              children: items.map((item) => 
                                Container(
                                  width: 150,
                                  child: LookbookComponent(item: item),
                                )
                              ).toList(),
                            ),
                          );
                        }
                      }
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
