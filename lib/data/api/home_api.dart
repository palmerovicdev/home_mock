import 'dart:math';

import '../../model/entity/item.dart';
import '../../model/entity/owner.dart';

abstract class HomeApi {
  Future<List<Item>> getHomes({
    required int page,
    String query = '',
    Category? category,
  });
}

class HomeApiImpl implements HomeApi {
  static const _pageSize = 8;
  static const _maxPages = 8;

  @override
  Future<List<Item>> getHomes({
    required int page,
    String query = '',
    Category? category,
  }) async {
    await Future.delayed(const Duration(milliseconds: 550));

    if (page > _maxPages) return [];

    final randomGenerator = Random(page);
    final List<Item> allItems = List.generate(_pageSize, (itemIndex) {
      final globalItemIndex = ((page - 1) * _pageSize) + itemIndex + 1;
      final itemCategory = category == Category.all
          ? Category.values[randomGenerator.nextInt(2)]
          : category ?? Category.values[randomGenerator.nextInt(2)];

      final titlesByCategory = {
        Category.apartment: 'BF Brockly',
        Category.house: 'Lovely Bird',
      };

      final availableCities = [
        'Sibgong',
        'Zindabazar',
        'Kensal',
        'Old Town',
      ];

      final imageUrlsByCategory = {
        Category.apartment: 'https://picsum.photos/id/$globalItemIndex/1200/1200',
        Category.house: 'https://picsum.photos/id/$globalItemIndex/1200/1200',
      };

      final descriptionsByCategory = {
        Category.apartment: 'A nice apartment located in the city center with all amenities nearby.',
        Category.house: 'A beautiful house with a garden and spacious rooms, perfect for families.',
      };

      final ownerNames = ['John Doe', 'Jane Smith', 'Mike Johnson', 'Sarah Williams'];
      final ownerCities = ['New York', 'Los Angeles', 'Chicago', 'Miami'];

      final owner = Owner(
        name: ownerNames[randomGenerator.nextInt(ownerNames.length)],
        avatarUrl: 'https://i.pravatar.cc/150?img=$globalItemIndex',
        city: ownerCities[randomGenerator.nextInt(ownerCities.length)],
      );

      return Item(
        id: 'home_$globalItemIndex',
        title: '${titlesByCategory[itemCategory]} #$globalItemIndex',
        city: availableCities[randomGenerator.nextInt(availableCities.length)],
        imageUrl: imageUrlsByCategory[itemCategory]!,
        price: 750 + randomGenerator.nextInt(900),
        description: descriptionsByCategory[itemCategory]!,
        isFavorite: randomGenerator.nextBool(),
        category: itemCategory,
        size: '${80 + randomGenerator.nextInt(120)} m²',
        bedrooms: 1 + randomGenerator.nextInt(4),
        bathrooms: 1 + randomGenerator.nextInt(3),
        owner: owner,
      );
    });

    final searchQuery = query.trim().toLowerCase();
    final filteredItems = allItems.where((item) {
      final matchesQuery = searchQuery.isEmpty || item.title.toLowerCase().contains(searchQuery) || item.city.toLowerCase().contains(searchQuery);
      final matchesCategory = category == null || item.category == category || category == Category.all;
      return matchesQuery && matchesCategory;
    }).toList();

    return filteredItems;
  }
}
