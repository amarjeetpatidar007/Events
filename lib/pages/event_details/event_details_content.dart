import 'package:flutter/material.dart';
import 'package:local_events/model/guest.dart';
import 'package:local_events/style.dart';
import 'package:provider/provider.dart';
import 'package:local_events/model/event.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.20),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
            child: FittedBox(
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(event.location,
                      style: eventLocationTextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),
          const Padding(
              padding: EdgeInsets.only(left: 16.0),
            child: Text('GUESTS', style: guestTextStyle,),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(final guest in guests) Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.asset(guest.imagePath,width: 90,height: 90,fit: BoxFit.cover,),

                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: event.punchLine1, style: punchLine1TextStyle),
                  TextSpan(text: event.punchLine2, style: punchLine2TextStyle)
                ]
              ),
            ),
          ),
          if(event.description.isNotEmpty) Padding(
            padding: const EdgeInsets.all(16),
            child: Text(event.description,style: eventLocationTextStyle,),
          ),
          if (event.galleryImages.isNotEmpty) const Padding(
            padding: EdgeInsets.only(left: 16.0,top: 16, bottom: 16),
            child: Text('GALLERY', style: guestTextStyle,),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(final galleryImagesPath in event.galleryImages) Container(
                  margin: const EdgeInsets.only(left: 16,right: 16, bottom: 32),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      galleryImagesPath,
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
