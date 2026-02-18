import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  int quantity = 1;
  String selectedSize = 'M';

  
  void incrementQuantity() {
    quantity++;
    emit(ProductSpecsChanged(quantity: quantity, selectedSize: selectedSize));
  }

  
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(ProductSpecsChanged(quantity: quantity, selectedSize: selectedSize));
    }
  }

  
  void changeSize(String newSize) {
    selectedSize = newSize;
    emit(ProductSpecsChanged(quantity: quantity, selectedSize: selectedSize));
  }
}