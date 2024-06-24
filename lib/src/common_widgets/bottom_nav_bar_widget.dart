import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../extensions/extensions.dart';
import '../features/dashboard/bloc/dashboard_bloc.dart';
import '../features/dashboard/bloc/dashboard_event.dart';
import '../features/dashboard/bloc/dashboard_state.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 70,
        right: 70,
        bottom: 20,
      ),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          int selectedIndex = 2;
          if (state is DashboardSuccess) {
            selectedIndex = state.selectedIndex;
          }

          return Container(
            padding: const EdgeInsets.only(
              bottom: 5.0,
              top: 5,
              left: 5.0,
              right: 5,
            ),
            decoration: BoxDecoration(
              color: HexColor('#292929'),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildNavItem(context, "assets/search.svg", 0, selectedIndex),
                _buildNavItem(context, "assets/message.svg", 1, selectedIndex),
                _buildNavItem(context, "assets/home.svg", 2, selectedIndex,
                    isSelected: true),
                _buildNavItem(context, "assets/heart.svg", 3, selectedIndex),
                _buildNavItem(context, "assets/person.svg", 4, selectedIndex),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String svgIcon,
    int index,
    int selectedIndex, {
    bool isSelected = false,
  }) {
    bool selected = selectedIndex == index;
    return GestureDetector(
      onTap: () =>
          BlocProvider.of<DashboardBloc>(context).add(NavigateTo(index)),
      child: CircleAvatar(
        backgroundColor: selected ? HexColor('#FFA500') : HexColor('#000000'),
        child: SvgPicture.asset(
          svgIcon,
          height: 20,
          width: 20,
          color: HexColor('#FFFFFF'),
        ),
      ),
    );
  }
}
