import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/constant.dart';

class BookingOptionsPopupMenuWidget extends StatelessWidget {
  const BookingOptionsPopupMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        elevation: 8,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onSelected: (item) {
          switch (item) {

            case 'Request':
              {
                // TODO decline the booking
              }
              break;
            case 'view':
              {}
              break;
          }
        },
        itemBuilder: (context) {
          var list = <PopupMenuEntry<Object>>[];
          list.add(PopupMenuItem(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: const [
                    Icon(Icons.assignment_outlined, color: kDarkBlue),
                    Text('View Detail',
                        style: TextStyle(color: Colors.black87))
                  ]),
              value: 'view'));
          list.add(const PopupMenuDivider(height: 10));
          list.add(PopupMenuItem(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: const [
                    Icon(Icons.request_quote_outlined,
                        color: kLightBlue),
                    Text('Request',
                        style: TextStyle(color: kLightBlue))
                  ]),
              value: 'Request'));
          return list;
        },
        child: const Icon(Icons.more_vert, color: kLightBlue));
  }
}
