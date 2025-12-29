import 'package:fixn_go/constants/assets.gen.dart';
import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final AssetGenImage image;
  final double size;
  final double borderRadius;

  const OnboardingImage({
    super.key,
    required this.image,
    this.size = 280,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: image.image(fit: BoxFit.contain),
    );
  }
}

class OnboardingTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final double lineHeight;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const OnboardingTitle({
    super.key,
    required this.title,
    this.fontSize = 32,
    this.lineHeight = 1.3,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight,
      ),
    );
  }
}

class OnboardingNextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;

  const OnboardingNextButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.yellow,
    this.icon = Icons.arrow_forward,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      child: Icon(icon, color: iconColor),
    );
  }
}

class OnboardingSubtitle extends StatelessWidget {
  final String subtitle;
  final double fontSize;
  final double lineHeight;
  final TextAlign textAlign;

  const OnboardingSubtitle({
    super.key,
    required this.subtitle,
    this.fontSize = 16,
    this.lineHeight = 1.5,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: textAlign,
      style: TextStyle(fontSize: fontSize, height: lineHeight),
    );
  }
}

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double fontSize;

  const OnboardingSkipButton({
    super.key,
    required this.onPressed,
    this.text = "Skip",
    this.color = Colors.grey,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: fontSize),
        ),
      ),
    );
  }
}
