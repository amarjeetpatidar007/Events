import 'package:local_events/model/event.dart';

import 'package:flutter/material.dart';

import '../../style.dart';


class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4.0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24))
      ),
      child: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Image.asset(event.imagePath, height: 150, fit: BoxFit.fitWidth,),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: eventTitleTextStyle,
                          ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                          child: FittedBox(
                            child: Row(
                              children: [
                                const Icon(Icons.location_on),
                                const SizedBox(width: 5),
                                Text(event.location, style: eventLocationTextStyle),
                              ],
                            ),
                          ),
                        ),
                        Text(event.duration.toUpperCase(),
                          textAlign: TextAlign.right,
                          style: eventLocationTextStyle.copyWith(fontWeight: FontWeight.w900),)
                        ],
                    )),

              ],
            )
          ],
        ),
      ),
    );
  }
}
