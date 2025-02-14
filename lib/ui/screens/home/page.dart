import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:openwardrobe/ui/widgets/dashboard/link.dart';
import 'package:openwardrobe/ui/widgets/wardrobe_item/wardrobe_item_component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final appRepo = GetIt.instance<AppRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashboardLink(
                    text: 'Upload Items',
                    icon: Icons.add,
                    color: Colors.blue,
                    onTap: () {},
                  ),
                  DashboardLink(
                    text: 'Create Outfit',
                    color: Colors.red,
                    icon: Icons.list,
                    onTap: () {},
                  ),
                  DashboardLink(
                    text: 'Schedule Outfit',
                    color: Colors.green,
                    icon: Icons.calendar_today,
                    onTap: () {},
                  ),
                  DashboardLink(
                    text: 'View Stats',
                    color: Colors.purple,
                    icon: Icons.bar_chart,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: FutureBuilder<List<WardrobeItem>>(
                  future: appRepo.get<WardrobeItem>(),
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
                            WardrobeItemComponent(item: item)
                          ).toList(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}