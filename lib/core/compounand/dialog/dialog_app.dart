import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../error/error_model.dart';

class BaseDialog {
  final BuildContext context;

  BaseDialog(this.context);

  static Future<void> showAlertDialog(BuildContext contextPar,
      ErrorModel errorModel, String image, Function() onConfirm,
      {bool? authentication, String? textConfrim}) async {
    return showDialog<void>(
      context: contextPar,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,

          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          // <-- SEE HERE
          title: Column(
            children: [
              const Icon(Icons.error, size: 40),
              Text(errorModel.title),
              Container(
                color: Colors.grey,
                height: 1,
                width: double.infinity,
              )
            ],
          ),

          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(errorModel.contant),
              ],
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 30,
                width: 60,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(24),
                        topLeft: Radius.circular(24))),
                child: const Center(
                    child: Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            authentication == null
                ? InkWell(
                    onTap: onConfirm,
                    child: Container(
                      height: 30,
                      width: 200,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: textConfrim == null
                          ? const Text("")
                          : Center(
                              child: Text(
                              textConfrim,
                            )),
                    ),
                  )
                : Container(
                    height: 30,
                    width: 200,
                  ),
          ],
        );
      },
    );
  }
}

// class DialogApp extends StatelessWidget {
//   final ErrorModel errorModel;
//   const DialogApp({super.key, required this.errorModel});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           Positioned.fill(
//               top: 40,
//               bottom: 0,
//               child: Container(
//                 height: 60,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(5))),
//                 child: Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: double.infinity,
//                         width: 5,
//                         decoration: const BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                       ),
//                       const SizedBox(width: 10),
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               "WARING",
//                               style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             AutoSizeText(
//                               errorModel.title,
//                               maxFontSize: 16,
//                               minFontSize: 12,
//                               maxLines: 1,
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             AutoSizeText(
//                               errorModel.contant,
//                               maxFontSize: 16,
//                               minFontSize: 12,
//                               maxLines: 3,
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                     ],
//                   ),
//                 ),
//               )),
//           Positioned(
//               bottom: 55,
//               right: 14,
//               child: InkWell(
//                 onTap: () =>
//                     ScaffoldMessenger.of(context).hideCurrentSnackBar(),
//                 child: Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle, color: Colors.white),
//                   child: Image.asset(
//                     AppIcon.closeIcon,
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
