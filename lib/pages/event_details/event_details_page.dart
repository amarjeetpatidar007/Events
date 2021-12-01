import 'package:flutter/material.dart';
import 'package:local_events/model/event.dart';
import 'package:provider/provider.dart';

import 'event_details_background.dart';
import 'event_details_content.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;
  const EventDetailPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: const [
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}
