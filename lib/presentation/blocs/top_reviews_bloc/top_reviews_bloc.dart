import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/data/repositories/product_repository.dart';
import 'package:prior_soft/presentation/blocs/top_reviews_bloc/top_reviews_event.dart';
import 'package:prior_soft/presentation/blocs/top_reviews_bloc/top_reviews_state.dart';

class TopReviewsBloc extends Bloc<TopReviewsEvent, TopReviewsState> {
  final ProductRepository productRepository;
  TopReviewsBloc({required this.productRepository}) :super(TopReviewsInitial()){
    on((event, emit)async {
      if(event is GetTopReviews){
        emit(TopReviewsLoading());
        final response = await productRepository.getTopReviews(event.productId);
        response.fold((error) => emit(TopReviewsError()), (result) => emit(TopReviewsSuccess(topReviews: result)));
      }
    });
  }
}