import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeCheck = false;
  var _lactoseFreeCheck = false;
  var _vegetarianCheck = false;
  var _veganCheck = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeCheck = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeCheck = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianCheck = widget.currentFilters[Filter.vegetarian]!;
    _veganCheck = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: MainDrawer(onSelectScreen: (identifier) {
        //   Navigator.of(context).pop();
        //   if (identifier == 'meals') {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
        //   }
        // }),

        appBar: AppBar(
          title: const Text("Filters"),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeCheck,
              Filter.lactoseFree: _lactoseFreeCheck,
              Filter.vegetarian: _vegetarianCheck,
              Filter.vegan: _veganCheck,
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeCheck,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeCheck = isChecked;
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22,
                ),
              ),
              SwitchListTile(
                value: _lactoseFreeCheck,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeCheck = isChecked;
                  });
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22,
                ),
              ),
              SwitchListTile(
                value: _veganCheck,
                onChanged: (isChecked) {
                  setState(() {
                    _veganCheck = isChecked;
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22,
                ),
              ),
              SwitchListTile(
                value: _vegetarianCheck,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianCheck = isChecked;
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegetarian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22,
                ),
              ),
            ],
          ),
        ));
  }
}
