import 'package:doulingo_fake/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:doulingo_fake/controllers/box_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/box_view/card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class BoxPage extends StatelessWidget {
  BoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
    
      child: BlocBuilder<VocabularyBloc, VocabularyState>(
        
        builder: (context, state) {
          if (state is VocabularyLoading || state is VocabularyInitial) {
            context.watch<VocabularyBloc>().add(GetVocabulary());
            return Center(child: CircularProgressIndicator());
          } else if (state is VocabularyLoaded) {
            final vocabulary = state.vocabularyList;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<VocabularyBloc>().add(GetVocabulary());
              },
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: vocabulary.length,
                  itemBuilder: (context, index) {
                    final item = vocabulary[index];
                    return Dismissible(
                        key: ValueKey<int>(index),
                        onDismissed: (direction) {
                          context.read<VocabularyBloc>().add(
                                DeleteVocabulary(
                                  key: index,
                                ),
                              );
                        },
                        child: CardItemWidget(
                          item: item,
                        ));
                  }),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
