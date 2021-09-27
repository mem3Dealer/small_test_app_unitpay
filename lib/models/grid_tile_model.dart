import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:small_test_task_unitpay/models/good.dart';
import '../app_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyGridItem extends StatelessWidget {
  Goodie goodie;
  MyGridItem({Key? key, required this.goodie}) : super(key: key);
  final appCubit = GetIt.I.get<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const SizedBox.expand(child: CircularProgressIndicator()),
                  imageUrl: goodie.url,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 6.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      goodie.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                        onPressed: () {
                          appCubit.deleteItem(goodie);
                        },
                        icon: const Icon(Icons.delete_outline_rounded))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
