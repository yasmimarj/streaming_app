// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GradientStore on _GradientStoreBase, Store {
  late final _$backgroundGradientAtom =
      Atom(name: '_GradientStoreBase.backgroundGradient', context: context);

  @override
  LinearGradient? get backgroundGradient {
    _$backgroundGradientAtom.reportRead();
    return super.backgroundGradient;
  }

  @override
  set backgroundGradient(LinearGradient? value) {
    _$backgroundGradientAtom.reportWrite(value, super.backgroundGradient, () {
      super.backgroundGradient = value;
    });
  }

  late final _$generateGradientAsyncAction =
      AsyncAction('_GradientStoreBase.generateGradient', context: context);

  @override
  Future<void> generateGradient(String imageUrl) {
    return _$generateGradientAsyncAction
        .run(() => super.generateGradient(imageUrl));
  }

  @override
  String toString() {
    return '''
backgroundGradient: ${backgroundGradient}
    ''';
  }
}
