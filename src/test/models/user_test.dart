
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/models/user.dart';

void main() {
	group('User Model Tests', () {
		test('User model should be created with correct properties', () {
			final user = User(email: 'test@example.com', name: 'Test User');
			expect(user.email, 'test@example.com');
			expect(user.name, 'Test User');
		});

		test('User model should serialize to JSON correctly', () {
			final user = User(email: 'test@example.com', name: 'Test User');
			final json = user.toJson();
			expect(json['email'], 'test@example.com');
			expect(json['name'], 'Test User');
		});

		test('User model should deserialize from JSON correctly', () {
			final json = {'email': 'test@example.com', 'name': 'Test User'};
			final user = User.fromJson(json);
			expect(user.email, 'test@example.com');
			expect(user.name, 'Test User');
		});

		test('User model should handle missing fields in JSON gracefully', () {
			final json = {'email': 'test@example.com'};
			final user = User.fromJson(json);
			expect(user.email, 'test@example.com');
			expect(user.name, isNull);
		});
	});
}
