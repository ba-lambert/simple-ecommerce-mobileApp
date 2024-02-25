class Brands {
  final String name;
  final String logo;
  Brands({required this.name, required this.logo});
}

final List<Brands> brand = [
  Brands(name: 'Nile', logo: 'assets/images/logo.png'),
  Brands(name: 'Addidas', logo: 'assets/images/logo.png'),
  Brands(name: 'Puma', logo: 'assets/images/logo.png'),
  Brands(name: 'Corolla', logo: 'assets/images/logo.png'),
];

final List<Map<String, dynamic>> productlists = [
  {
    'title': 'Nike Shoes',
    'description': 'Description goes here',
    'photos': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'Adidas Shoes',
    'description': 'Description goes here',
    'photos': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'Puma Shoes',
    'description': 'Description goes here',
    'photos': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'Reebok Shoes',
    'description': 'Description goes here',
    'photos': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'New Balance Shoes',
    'description': 'Description goes here',
    'photos': [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
];
