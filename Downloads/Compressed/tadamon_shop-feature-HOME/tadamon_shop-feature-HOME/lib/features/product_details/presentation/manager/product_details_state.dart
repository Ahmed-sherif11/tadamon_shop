abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}


class ProductSpecsChanged extends ProductDetailsState {
  final int quantity;
  final String selectedSize;

  ProductSpecsChanged({required this.quantity, required this.selectedSize});
}