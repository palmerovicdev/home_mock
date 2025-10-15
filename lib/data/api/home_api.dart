import 'dart:math';

import '../../model/entity/item.dart';
import '../../model/entity/owner.dart';

abstract class HomeApi {
  Future<List<Item>> getAllHomes();
}

class HomeApiImpl implements HomeApi {
  static const _totalItems = 50; // Genera 50 propiedades

  @override
  Future<List<Item>> getAllHomes() async {
    // Simula carga inicial (solo se ejecuta una vez)
    await Future.delayed(const Duration(milliseconds: 1500));

    final randomGenerator = Random(42); // Seed fijo para datos consistentes
    final List<Item> allItems = List.generate(_totalItems, (index) {
      final globalItemIndex = index + 1;
      final itemCategory = Category.values[randomGenerator.nextInt(2)];

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
        Category.apartment:
            'https://picsum.photos/id/$globalItemIndex/1200/1200',
        Category.house: 'https://picsum.photos/id/$globalItemIndex/1200/1200',
      };

      final descriptionsByCategory = {
        Category.apartment:
            'A nice apartment located in the city center with all amenities nearby.',
        Category.house:
            'A beautiful house with a garden and spacious rooms, perfect for families.',
      };

      final ownerNames = [
        'John Doe',
        'Jane Smith',
        'Mike Johnson',
        'Sarah Williams',
      ];
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

    return allItems;
  }
}
