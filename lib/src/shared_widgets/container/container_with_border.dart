import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_consts/app_color.dart';

///
/// O widget [ContainerWithBorder] é um container com bordas arredondadas coloridas e sombra.
/// [borderColor] é a cor das bordas do container.
/// [child] é o conteúdo de dentro do container.
/// [containsLeftBorder] define se há borda na esquerda.
/// [containsBottomBorder] define se há borda inferior.
/// [containsRightBorder] define se há borda na direita.
/// [containsTopBorder] define se há borda superior.
///
/// Caso não seja definido nenhuma borda, nenhuma borda será exibida.
///
class ContainerWithBorder extends StatelessWidget {
  const ContainerWithBorder({
    super.key,
    required this.borderColor,
    required this.child,
    this.containsLeftBorder = false,
    this.containsTopBorder = false,
    this.containsRightBorder = false,
    this.containsBottomBorder = false,
    this.containsShadow = true,
  });

  final Color borderColor;
  final Widget child;
  final bool containsLeftBorder, containsBottomBorder;
  final bool containsRightBorder, containsTopBorder;
  final bool containsShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
        boxShadow: containsShadow
            ? <BoxShadow>[
                BoxShadow(
                  color: AppColor.graySlate.withOpacity(0.35),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          containsLeftBorder ? 4 : 0,
          containsTopBorder ? 4 : 0,
          containsRightBorder ? 4 : 0,
          containsBottomBorder ? 4 : 0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.whitePure,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: child,
          ),
        ),
      ),
    );
  }
}
