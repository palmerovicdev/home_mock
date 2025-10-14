import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/model/entity/item.dart';
import 'package:home_mock/model/entity/owner.dart';

void main() {
  group('Item', () {
    test('should create item with all properties', () {
      final owner = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      final item = Item(
        id: 'test_id',
        title: 'Test Property',
        city: 'Test City',
        imageUrl: 'https://example.com/image.jpg',
        price: 1000,
        category: Category.apartment,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
        owner: owner,
        isFavorite: false,
      );

      expect(item.id, equals('test_id'));
      expect(item.title, equals('Test Property'));
      expect(item.city, equals('Test City'));
      expect(item.imageUrl, equals('https://example.com/image.jpg'));
      expect(item.price, equals(1000));
      expect(item.category, equals(Category.apartment));
      expect(item.description, equals('Test description'));
      expect(item.size, equals('100 m²'));
      expect(item.bedrooms, equals(2));
      expect(item.bathrooms, equals(1));
      expect(item.owner, equals(owner));
      expect(item.isFavorite, equals(false));
    });

    test('should have default isFavorite value', () {
      final item = Item(
        id: 'test_id',
        title: 'Test Property',
        city: 'Test City',
        imageUrl: 'https://example.com/image.jpg',
        price: 1000,
        category: Category.apartment,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
        owner: Owner(
          name: 'John Doe',
          avatarUrl: 'https://example.com/avatar.jpg',
          city: 'New York',
        ),
      );

      expect(item.isFavorite, equals(false));
    });

    test('should be equal when all properties are the same', () {
      final owner = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      final item1 = Item(
        id: 'test_id',
        title: 'Test Property',
        city: 'Test City',
        imageUrl: 'https://example.com/image.jpg',
        price: 1000,
        category: Category.apartment,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
        owner: owner,
        isFavorite: false,
      );

      final item2 = Item(
        id: 'test_id',
        title: 'Test Property',
        city: 'Test City',
        imageUrl: 'https://example.com/image.jpg',
        price: 1000,
        category: Category.apartment,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
        owner: owner,
        isFavorite: false,
      );

      expect(item1, equals(item2));
    });

    test('should not be equal when properties differ', () {
      final owner = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      final item1 = Item(
        id: 'test_id',
        title: 'Test Property',
        city: 'Test City',
        imageUrl: 'https://example.com/image.jpg',
        price: 1000,
        category: Category.apartment,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
        owner: owner,
        isFavorite: false,
      );

      final item2 = Item(
        id: 'test_id',
        title: 'Different Property',
        city: 'Test City',
        imageUrl: 'https://example.com/image.jpg',
        price: 1000,
        category: Category.apartment,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
        owner: owner,
        isFavorite: false,
      );

      expect(item1, isNot(equals(item2)));
    });

    test('copyWith should create new instance with updated properties', () {
      final owner = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      final originalItem = Item(
        id: 'test_id',
        title: 'Test Property',
        city: 'Test City',
        imageUrl: 'https://example.com/image.jpg',
        price: 1000,
        category: Category.apartment,
        description: 'Test description',
        size: '100 m²',
        bedrooms: 2,
        bathrooms: 1,
        owner: owner,
        isFavorite: false,
      );

      final updatedItem = originalItem.copyWith(
        title: 'Updated Property',
        price: 1500,
        isFavorite: true,
      );

      expect(updatedItem.title, equals('Updated Property'));
      expect(updatedItem.price, equals(1500));
      expect(updatedItem.isFavorite, equals(true));
      expect(updatedItem.id, equals('test_id'));
      expect(updatedItem.city, equals('Test City'));
    });
  });

  group('Owner', () {
    test('should create owner with all properties', () {
      final owner = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      expect(owner.name, equals('John Doe'));
      expect(owner.avatarUrl, equals('https://example.com/avatar.jpg'));
      expect(owner.city, equals('New York'));
    });

    test('should be equal when all properties are the same', () {
      final owner1 = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      final owner2 = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      expect(owner1, equals(owner2));
    });

    test('should not be equal when properties differ', () {
      final owner1 = Owner(
        name: 'John Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      final owner2 = Owner(
        name: 'Jane Doe',
        avatarUrl: 'https://example.com/avatar.jpg',
        city: 'New York',
      );

      expect(owner1, isNot(equals(owner2)));
    });
  });

  group('Category', () {
    test('should have correct enum values', () {
      expect(Category.apartment.name, equals('apartment'));
      expect(Category.house.name, equals('house'));
      expect(Category.all.name, equals('all'));
    });

    test('should have correct enum values count', () {
      expect(Category.values.length, equals(3));
    });
  });
}
