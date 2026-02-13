import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/cart_model.dart';

class CartCubit extends Cubit<List<CartProductModel>> {
  CartCubit() : super([]);

  double promoDiscountPercent = 0.0; 
  final double fixedDiscount = 10.0; 
  final double shippingCost = 5.0; 

  final Map<String, double> availablePromoCodes = {
    "AMANY10": 0.10,   
    "WELCOME20": 0.20, 
    "SALE50": 0.50,    
  };

  void loadCartItems() {
    emit([
      CartProductModel(id: '1', title: 'تي شيرت من القطن المصري', image: 'assets/images/pic1.jpg', size: 'M', price: 120.0),
      CartProductModel(id: '2', title: 'جينز الكلاسيكي', image: 'assets/images/pic2.jpg', size: '38', price: 150.0),
      CartProductModel(id: '3', title: 'أحذية الكاحل الجلدية', image: 'assets/images/pic3.jpg', size: '8', price: 160.0),
    ]);
  }

  void incrementQuantity(String productId) {
    var items = [...state];
    var index = items.indexWhere((item) => item.id == productId);
    if (index != -1) {
      items[index].quantity++;
      emit(items); 
    }
  }

  void decrementQuantity(String productId) {
    var items = [...state];
    var index = items.indexWhere((item) => item.id == productId);
    if (index != -1 && items[index].quantity > 1) {
      items[index].quantity--;
      emit(items);
    }
  }

  void applyPromoCode(String code) {
    String cleanCode = code.toUpperCase().trim(); 
    if (availablePromoCodes.containsKey(cleanCode)) {
      promoDiscountPercent = availablePromoCodes[cleanCode]!;
    } else {
      promoDiscountPercent = 0.0; 
    }
    emit([...state]); 
  }

  double get subtotal {
    return state.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
  double get total {
    double currentSubtotal = subtotal;
    double promoAmount = currentSubtotal * promoDiscountPercent;
    double finalTotal = (currentSubtotal - promoAmount - fixedDiscount) + shippingCost;
    
    return finalTotal > 0 ? finalTotal : 0; 
  }
}