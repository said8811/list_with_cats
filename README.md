<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# ListViewWithCategories

A flexible Flutter package that provides a customizable list view with categories, allowing developers to easily implement a categorized list view in their Flutter applications. This package supports both horizontal and vertical layouts, catering to a wide range of use cases.

## Features

- **Customizable Dimensions:** Set the width, height, and gap between categories to fit your UI design.
- **Orientation Support:** Choose between a column or row layout for your categories and list view.
- **Scroll Controllers:** Integrated with `ScrollablePositionedList` for precise scroll position control and `ItemPositionsListener` for scroll event handling.
- **Dynamic Item Building:** Use custom builder functions for list items and categories, providing flexibility in content rendering.

## Getting Started

To use this package, add `ListViewWithCategories` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  list_with_categories: latest_version
  ```

## Usage

The `ListViewWithCategories` widget allows for the creation of a categorized list view with customizable dimensions, orientation, and item builders. Here's how to use it in your Flutter project:

### Basic Setup

First, ensure you have the package imported in your Dart file:

```dart
import 'package:your_package_name/ListViewWithCategories.dart';

```

```dart

ListViewWithCategories(
          controller: controller,
          scrollListener: listScrollListener,
          itemsLength: cats.length,
          itemBuilder: (_, index) {
            final sectionLetter = cats[index];
            final animal = groupedBrands[sectionLetter] ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    sectionLetter,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...animal.map(
                  (e) => ListTile(
                    title: Text(e),
                  ),
                )
              ],
            );
          },
          categoryBuilder: (_, index) {
            return InkWell(
                onTap: () {
                  controller.scrollTo(
                      index: index,
                      duration: const Duration(milliseconds: 200));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cats[index]),
                ));
          },),
```