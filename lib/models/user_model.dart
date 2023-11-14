class User {
  final String name;
  final String email;
  final String number;

  User({
    required this.name,
    required this.email,
    required this.number,
  });
}

final List<User> users = [
  User(
    name: 'John Doe',
    email: 'john.doe@example.com',
    number: '123-456-7890',
  ),
  User(
    name: 'Jane Smith',
    email: 'jane.smith@example.com',
    number: '987-654-3210',
  ),
  User(
    name: 'Bob Johnson',
    email: 'bob.johnson@example.com',
    number: '555-123-4567',
  ),
];
