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
    'description':
        'The Nike Air Zoom Pegasus 38 continues to put a spring in your step, using the same responsive foam as its predecessor. Breathable mesh in the upper combines the comfort and durability you want with a wider fit at the toes. Prepare to break records and reach new heights with every run in the Nike Air Zoom Pegasus 38. Whether you’re a seasoned runner or just getting started, this shoe has what you need to stay comfortable and confident mile after mile. The responsive foam cushioning delivers a smooth, springy ride with every stride, while the breathable mesh upper keeps your feet cool and comfortable even on hot days. With a wider fit at the toes, you’ll have plenty of room to move and flex naturally as you run. And with its stylish design and vibrant colorways, the Nike Air Zoom Pegasus 38 is sure to turn heads wherever you go.',
    'price': '2500 rwf',
    'photos': [
      'assets/images/air.webp',
      'assets/images/air.webp',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'Adidas Shoes',
    'description':
        'The Adidas Ultraboost running shoe is designed to provide maximum comfort and energy return with every step. Featuring Adidas\' innovative Boost technology, the Ultraboost delivers responsive cushioning that absorbs impact and returns energy to propel you forward. The Primeknit upper wraps your foot in adaptive support and ultralight comfort, while the Stretchweb outsole flexes naturally to adapt to your footstrike. Whether you\'re hitting the pavement or the treadmill, the Adidas Ultraboost will take your running experience to the next level.',
    'price': '2500 rwf',
    'photos': [
      'assets/images/force.webp',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'Puma Shoes',
    'description':
        'Step up your style game with the Puma Future Rider sneaker. Featuring a retro-inspired design with modern updates, this sneaker offers a perfect blend of vintage charm and contemporary appeal. The lightweight and breathable upper keeps your feet cool and comfortable all day long, while the cushioned midsole provides responsive shock absorption for a smooth ride. Whether you\'re running errands or hitting the streets, the Puma Future Rider is sure to turn heads wherever you go.',
    'price': '2500 rwf',
    'photos': [
      'assets/images/Nike.webp',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'Reebok Shoes',
    'description':
        'The Reebok Nano X CrossFit shoe is engineered to help you conquer your toughest workouts. With a lightweight and breathable design, this shoe offers maximum comfort and support for all your training needs. The flexible outsole provides superior grip and stability, while the cushioned midsole absorbs impact to reduce fatigue and keep you going strong. Whether you\'re lifting weights, running, or jumping, the Reebok Nano X will help you perform at your best.',
    'price': '2500 rwf',
    'photos': [
      'assets/images/tesla.webp',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
  {
    'title': 'New Balance Shoes',
    'description':
        'The New Balance Fresh Foam 1080v11 running shoe is designed for runners who demand the ultimate in cushioning and comfort. Featuring New Balance\'s signature Fresh Foam midsole, this shoe provides plush cushioning and a responsive ride with every step. The engineered mesh upper offers lightweight breathability and a supportive fit, while the Ultra Heel design hugs the back of the foot for a secure lockdown. Whether you\'re logging miles on the road or hitting the trails, the New Balance Fresh Foam 1080v11 will keep you comfortable and supported mile after mile.',
    'price': '2500 rwf',
    'photos': [
      'assets/images/IMG_5072.jpg',
      'assets/images/logo.png',
      'assets/images/logo.png'
    ]
  },
];
