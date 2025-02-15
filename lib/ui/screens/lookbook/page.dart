import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/lookbook.model.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:openwardrobe/ui/widgets/lookbook/lookbook_component.dart';

class LookbookScreen extends StatelessWidget {
   LookbookScreen({super.key});

  final appRepo = GetIt.instance<AppRepository>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Welcome, username and profile picture
        title: const Text('Lookbook'),
      ),
      body: SingleChildScrollView(
          
            child: IntrinsicHeight(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
            // DashboardLink
            children: [
              // Max width for row
              const SizedBox(height: 20),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: FutureBuilder<List<Lookbook>>(
                  future: appRepo.get<Lookbook>(),
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
          )
          ),
      )
    );
  }
}
