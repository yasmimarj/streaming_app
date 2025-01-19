import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:palette_generator/palette_generator.dart';

part 'gradient_store.g.dart';

class GradientStore = _GradientStoreBase with _$GradientStore;

abstract class _GradientStoreBase with Store {
  @observable
  LinearGradient? backgroundGradient;

  @action
  Future<void> generateGradient(String imageUrl) async {
    try {
      // Gera a paleta de cores a partir da imagem
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
      );

      // Extrai as cores dominantes e vibrantes da imagem
      final Color? dominantColor = paletteGenerator.dominantColor?.color;
      final Color? vibrantColor = paletteGenerator.vibrantColor?.color;
      final Color? mutedColor = paletteGenerator.mutedColor?.color;

      // Verifica as cores disponíveis e cria um gradiente
      backgroundGradient = LinearGradient(
        colors: [
          Colors.transparent, // Parte superior transparente
          mutedColor?.withAlpha((0.3 * 255).toInt()) ??
              Colors.black38, // Cor neutra/muted
          vibrantColor?.withAlpha((0.5 * 255).toInt()) ??
              Colors.black54, // Cor vibrante
          vibrantColor?.withAlpha((0.7 * 255).toInt()) ??
              Colors.black87, // Cor vibrante mais intensa
          dominantColor?.withAlpha((0.9 * 255).toInt()) ??
              Colors.black, // Cor dominante preta no final
        ],
        stops: const [0.0, 0.3, 0.6, 0.8, 1.0], // Transições suaves
        begin: Alignment.bottomCenter, // Início no topo
        end: Alignment.topCenter, // Fim na base
      );
    } catch (e) {
      print("Erro ao gerar gradiente: $e");
    }
  }
}
