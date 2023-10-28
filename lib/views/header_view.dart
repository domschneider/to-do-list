import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:todo_list/views/bottom_sheets/settings_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          children: [
            // will be the start of new todos left widget
            // Expanded(
            //     flex: 3,
            //     child: Container(
            //       margin: EdgeInsets.only(left: 15),
            //       child: Column(children: [
            //         Expanded(
            //           flex: 1,
            //           child: Align(
            //             alignment: Alignment.bottomLeft,
            //             child: FittedBox(
            //               fit: BoxFit.fitHeight,
            //               child: Text("Welcome back,",
            //                   style: TextStyle(
            //                       fontSize: 23,
            //                       fontWeight: FontWeight.w400,
            //                       color: viewModel.clrLvl4)),
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           flex: 2,
            //           child: Align(
            //             alignment: Alignment.topLeft,
            //             child: FittedBox(
            //               fit: BoxFit.fitHeight,
            //               child: Text(viewModel.username,
            //                   style: TextStyle(
            //                       fontSize: 42,
            //                       fontWeight: FontWeight.bold,
            //                       color: viewModel.clrLvl4)),
            //             ),
            //           ),
            //         )
            //       ]),
            //     )),

            Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                      //color: viewModel.clrLvl2,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text("${viewModel.numTodosRemaining}",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: viewModel.clrLvl3,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(children: [
                              Text("Todos",
                                  style: TextStyle(
                                      fontSize: 500,
                                      color: viewModel.clrLvl4,
                                      fontWeight: FontWeight.w600)),
                              Text("Left",
                                  style: TextStyle(
                                      fontSize: 500,
                                      color: viewModel.clrLvl4,
                                      fontWeight: FontWeight.w600)),
                            ]),
                          ),
                        ),
                      )
                    ],
                  )),
            ),

            // Trash Icon
            Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      viewModel.bottomSheetBuilder(
                          DeleteBottomSheetView(), context);
                    },
                    child: Icon(Icons.delete,
                        color: viewModel.clrLvl3, size: 40))),
            // Settings Icon
            // this will where the dark-mode icon to go
            Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      HapticFeedback.mediumImpact();

                      viewModel.bottomSheetBuilder(
                          SettingsBottomSheetView(), context);
                    },
                    child: Icon(Icons.settings,
                        color: viewModel.clrLvl3, size: 40))),
          ],
        );
      },
    );
  }
}
