import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_models/app_view_model.dart';
import 'package:todo_list/views/bottom_sheets/name_bottom_sheet_view.dart';

class SettingsBottomSheetView extends StatelessWidget {
  const SettingsBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
          height: 125,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Welcome Back, "), Text(viewModel.username)],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        viewModel.bottomSheetBuilder(
                            ChangeNameBottomSheetView(), context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: viewModel.clrLvl1,
                        backgroundColor: viewModel.clrLvl3,
                      ),
                      child: Text("Edit Username")),
                  SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: viewModel.clrLvl1,
                        backgroundColor: viewModel.clrLvl3,
                      ),
                      child: Icon(
                        Icons.light_mode,
                        color: viewModel.clrLvl1,
                        size: 40,
                      )),
                  SizedBox(width: 15),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: viewModel.clrLvl1,
                        backgroundColor: viewModel.clrLvl3,
                      ),
                      child: Icon(Icons.dark_mode,
                          color: viewModel.clrLvl1, size: 40))
                ],
              )
            ],
          ));
    });
  }
}
