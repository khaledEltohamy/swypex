import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:swypex/core/compounand/loading/loading_text.dart';
import 'package:swypex/src/home/presentation/bloc/currrency_cubit/base_cubit.dart';
import 'package:swypex/src/home/presentation/bloc/countries_bloc/countries_bloc.dart';
import 'package:swypex/src/home/presentation/bloc/currrency_cubit/symbols_cubit.dart';
import '../../../../../core/compounand/search_bar/floationg_search_bar.dart';
import '../../bloc/search_cubit/searchbar_base_cubit.dart';
import 'data_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  FloatingSearchBarController baseSearchController =
      FloatingSearchBarController();
  FloatingSearchBarController symbolSearchController =
      FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const DataScreen(),
          buildFloatingSearchBarSambole(context),
          buildFloatingSearchBarBase(context),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBarBase(BuildContext context) {
    var selectedCountry = context.watch<BaseCubit>().selectedCountry;
    return Positioned(
      top: 120,
      right: 210,
      left: 10,
      bottom: 20,
      child: FloatingSearchBarApp(
        hint: selectedCountry,
        edgeInsetsMargin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        borderRaduisSearch: const BorderRadius.all(Radius.circular(0)),
        onFocusChanged: (isFoucesd) {
          if (isFoucesd) {
            BlocProvider.of<CountriesBloc>(context).add(GetCountriesList());
          }
        },
        actions: [
          baseSearchController.isOpen
              ? IconButton(
                  onPressed: () => baseSearchController.close(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                )
              : Container(),
        ],
        onSubmittedCalled: (query) =>
            BlocProvider.of<CountriesBloc>(context).add(GetSearchList(query)),
        onQueryChangedCalled: (query) =>
            BlocProvider.of<CountriesBloc>(context).add(GetSearchList(query)),
        controller: baseSearchController,
        resultBuilder: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [_buildAreaSearchBody(context)],
            ),
          ),
        ),
        withBackButton: false,
        title: 'BASE',
      ),
    );
  }

  Widget buildFloatingSearchBarSambole(BuildContext context) {
    var selectedCountry = context.watch<SymbolsCubit>().selectedCountry;
    return Positioned(
      top: 120,
      left: 210,
      right: 10,
      bottom: 40,
      child: FloatingSearchBarApp(
        hint: selectedCountry,
        edgeInsetsMargin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        borderRaduisSearch: const BorderRadius.all(Radius.circular(0)),
        onFocusChanged: (isFoucesd) {
          if (isFoucesd) {
            BlocProvider.of<CountriesBloc>(context).add(GetCountriesList());
          }
        },
        actions: [
          symbolSearchController.isOpen
              ? IconButton(
                  onPressed: () => symbolSearchController.close(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                )
              : Container(),
        ],
        onSubmittedCalled: (query) =>
            BlocProvider.of<CountriesBloc>(context).add(GetSearchList(query)),
        onQueryChangedCalled: (query) =>
            BlocProvider.of<CountriesBloc>(context).add(GetSearchList(query)),
        controller: symbolSearchController,
        resultBuilder: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [_buildAreaSearchBodySymbole(context)],
            ),
          ),
        ),
        withBackButton: false,
        title: 'Symbole',
      ),
    );
  }

  _buildAreaSearchBody(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
      if (state is CountriesLoading) {
        return const Center(child: LoadingTextWidget(withText: false));
      } else if (state is CountriesOffline) {
        return const Center(
          child: Text("YOU ARE OFFLINE"),
        );
      } else if (state is CountriesField) {
        return const Center(
          child: Text("SomeThing Went Wrong Please try agin later"),
        );
      } else if (state is UpdateCountriesSuccess) {
        List<String> list = state.compound_list;
        return list.isEmpty
            ? const Center(
                child: Text(
                  "No Result",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) => _iteamAreaLocation(
                    context, list[index], baseSearchController));
      } else if (state is CountriesSuccess) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.countries.countries.length,
            itemBuilder: (context, index) => _iteamAreaLocation(context,
                state.countries.countries[index], baseSearchController));
      } else {
        return Container();
      }
    });
  }

  _buildAreaSearchBodySymbole(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
      if (state is CountriesLoading) {
        return const Center(child: LoadingTextWidget(withText: false));
      } else if (state is CountriesOffline) {
        return const Center(
          child: Text("OFFLINE MODE PLEASE CHECK CONNECTION"),
        );
      } else if (state is CountriesField) {
        return const Center(
          child: Text("OFFLINE MODE PLEASE CHECK CONNECTION"),
        );
      } else if (state is UpdateCountriesSuccess) {
        List<String> list = state.compound_list;
        return list.isEmpty
            ? const Center(
                child: Text(
                  "No Result",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) => _iteamAreaLocationSymbole(
                    context, list[index], symbolSearchController));
      } else if (state is CountriesSuccess) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.countries.countries.length,
            itemBuilder: (context, index) => _iteamAreaLocationSymbole(context,
                state.countries.countries[index], symbolSearchController));
      } else {
        return Container();
      }
    });
  }

  _iteamAreaLocation(BuildContext context, String base,
      FloatingSearchBarController controller) {
    var selectedBase = context.watch<BaseCubit>().selectedCountry;
    var searchBarBaseState = context.watch<SearchBarBaseCubit>().isOpened;
    var searchBarSymbolState = context.watch<SearchBarBaseCubit>().isOpened;
    return InkWell(
      onTap: () {
        controller.close();
        BlocProvider.of<BaseCubit>(context).getSelectedArea(base);
        BlocProvider.of<SearchBarBaseCubit>(context).changeState();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.all(8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue.shade100),
                child: Icon(
                  Icons.copyright_outlined,
                  color: Colors.blue.shade900,
                ),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: base,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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

  _iteamAreaLocationSymbole(BuildContext context, String symbole,
      FloatingSearchBarController controller) {
    var selectedSymbole = context.watch<SymbolsCubit>().selectedCountry;
    // var searchBarState = context.watch<SearchBarCubit>().isOpened;
    return InkWell(
      onTap: () {
        controller.close();
        BlocProvider.of<SymbolsCubit>(context).getSelectedArea(symbole);
        BlocProvider.of<SearchBarBaseCubit>(context).changeState();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.all(8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue.shade100),
                child: Icon(
                  Icons.copyright_outlined,
                  color: Colors.blue.shade900,
                ),
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: symbole,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
