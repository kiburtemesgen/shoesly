import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/data/repositories/product_repository.dart';
import 'package:prior_soft/presentation/blocs/get_reviews_bloc/get_reviews_event.dart';
import 'package:prior_soft/presentation/blocs/get_reviews_bloc/get_reviews_state.dart';

class GetReviewsBloc extends Bloc<GetReviewsEvent, GetReviewsState> {
  final ProductRepository productRepository;
  GetReviewsBloc({required this.productRepository})
      : super(GetReviewsInitial()) {
    on((event, emit) async {
      if (event is GetReview) {
        emit(GetReviewsLoading());
        final response =
            await productRepository.getReviews(event.productId, event.rating);
        response.fold((error) => emit(GetReviewsError()),
            (result) => emit(GetReviewsSuccess(reviews: result)));
      }
    });
  }
}
