import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_mate/core/manager/delete_from_cart_cubit/delete_product_cubit.dart';
import 'package:shop_mate/core/manager/fetch_cart_cubit.dart/fetch_cart_products_cubit.dart';
import 'package:shop_mate/features/cart/presentation/views/widgets/my_cart_item.dart';

import '../../../../../core/utils/app_styles.dart';

class MyCartItemListView extends StatelessWidget {
  const MyCartItemListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCartProductsCubit, FetchCartProductsState>(
      builder: (context, state) {
        if (state is FetchCartProductsSuccess) {
          return (state.productsList.isEmpty)
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Transform.translate(
                    offset: const Offset(0, -60),
                    child: Center(
                      child: Text(
                        'No items in cart',
                        style: AppStyles.semiBoldPoppins28.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : SliverList.builder(
                  itemCount: state.productsList.length,
                  itemBuilder: (BuildContext context, int index) => Slidable(
                    key: ValueKey(state.productsList[index].id),
                    endActionPane: ActionPane(
                      extentRatio: 0.4,
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () async {
                          await BlocProvider.of<DeleteFromCartCubit>(context)
                              .deleteFromCart(
                            productModel: state.productsList[index],
                          );
                          BlocProvider.of<FetchCartProductsCubit>(context)
                              .fetchCartProducts();
                        },
                      ),
                      children: [
                        SlidableAction(
                          onPressed: (context) async {
                            await BlocProvider.of<DeleteFromCartCubit>(context)
                                .deleteFromCart(
                                    productModel: state.productsList[index]);
                            BlocProvider.of<FetchCartProductsCubit>(context)
                                .fetchCartProducts();
                          },
                          backgroundColor: Colors.red.shade400,
                          foregroundColor: Colors.white,
                          icon: IconlyBold.delete,
                          label: 'Remove',
                          borderRadius: BorderRadius.circular(12),
                          spacing: 8,
                        ),
                      ],
                    ),
                    child: (index != state.productsList.length - 1)
                        ? MyCartItem(
                            product: state.productsList[index],
                          )
                        : MyCartItem(
                            bottomDivider: false,
                            product: state.productsList[index],
                          ),
                  ),
                );
        } else if (state is FetchCartProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessege,
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
