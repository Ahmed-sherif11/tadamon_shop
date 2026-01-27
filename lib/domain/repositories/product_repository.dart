import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';
import '../../core/error/failures.dart'; // سننشئه لاحقاً للتعامل مع الأخطاء

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
