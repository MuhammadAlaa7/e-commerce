class PaymentMethod {
  final String name;
  final String image;

  PaymentMethod({
    required this.name,
    required this.image,
  });

  static PaymentMethod empty() => PaymentMethod(
        name: '',
        image: '',
      );
}
