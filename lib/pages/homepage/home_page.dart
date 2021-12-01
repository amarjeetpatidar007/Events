import 'package:flutter/material.dart';
import 'package:local_events/model/category.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/pages/event_details/event_details_page.dart';
import 'package:local_events/pages/homepage/home_page_background.dart';
import 'package:local_events/style.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import 'category_widget.dart';
import 'event_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Scaffold(
        body: Stack(
          children: [
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: const [
                          Text(
                            "LOCAL EVENTS",
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(Icons.person_outline,
                              color: Color(0x99FFFFFF), size: 30)
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          "What's Up",
                          style: whiteHeadingTextStyle,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) =>
                            SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final category in categories)
                                CategoryWidget(category: category)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: [
                            for (final event in events.where((element) => element
                                .categoryIds
                                .contains(appState.selectedCategoryId)))
                              GestureDetector(child: EventWidget(event: event),
                                onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => EventDetailPage(event:event
                                  )));
                                },
                              )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
