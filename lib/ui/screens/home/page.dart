import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/Wardrobe_Item.model.dart';
import 'package:openwardrobe/services/wardrobe_item_service.dart';
// import  waardrobe service from this project
import 'package:openwardrobe/ui/widgets/dashboard/link.dart';
import 'package:get_it/get_it.dart';
import 'package:openwardrobe/ui/widgets/wardrobe_item/wardrobe_item_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Align(
          alignment: Alignment
              .topCenter,
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child:
                    // Make a row
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DashboardLink(
                      text: 'Upload Items',
                      color: Colors.blue,
                      icon: Icons.add,
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
                    // View my stats
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
                    future: GetIt.instance<WardrobeItemService>().getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final items = snapshot.data ?? [];

                      if (items.isEmpty) {
                        return const Center(child: Text('No items found'));
                      }

                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text("test"));
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
