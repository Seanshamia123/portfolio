
import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:url_launcher/link.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    required this.child,
    this.borderEffect = false,
    this.link,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  final bool borderEffect;
  final String? link;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Link(
        uri: Uri.parse(widget.link ?? ''),
        target: LinkTarget.blank,
        builder: (context, FollowLink) {
          return InkWell(
            onTap: FollowLink,
            child: Stack(
              children: [
                if (widget.borderEffect) ...[
                  const _BorderShadow(),
                  const Positioned(bottom: 0, right: 0, child: _BorderShadow()),
                ],
                Container(
                  width: widget.width,
                  height: widget.height,
                  padding: widget.padding ??
                      EdgeInsets.all(context.insets.cardpadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colorscheme.outline),
                    color: context.colorscheme.surface,
                    borderRadius: widget.borderRadius ??
                        const BorderRadius.all(Radius.circular(24)),
                  ),
                  child: widget.child,
                ),
                if (widget.borderEffect) ...[
                  CustomPaint(
                    size: Size(widget.width ?? 0, widget.height ?? 0),
                    painter:
                        CurveLinePainter(color: context.colorscheme.primary),
                  ),
                ],
              ],
            ),
          );
        });
  }
}

class CurveLinePainter extends CustomPainter {
  final Color color;

  CurveLinePainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const lineSize = 60.0;
    final topLeftPaint = Paint()
      ..shader = LinearGradient(
        colors: [color.withOpacity(0), color, color.withOpacity(0)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(const Rect.fromLTWH(0, 0, lineSize, lineSize))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final bottomRightPaint = Paint()
      ..shader = LinearGradient(
        colors: [color.withOpacity(0), color, color.withOpacity(0)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ).createShader(
        Rect.fromLTWH(
          size.width - lineSize,
          size.width - lineSize,
          lineSize,
          lineSize,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);
    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );

    canvas.drawPath(path, topLeftPaint);
    canvas.drawPath(path2, bottomRightPaint);
  }

  @override
  bool shouldRepaint(CurveLinePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CurveLinePainter oldDelegate) => true;
}

class _BorderShadow extends StatelessWidget {
  const _BorderShadow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: context.colorscheme.primary.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
