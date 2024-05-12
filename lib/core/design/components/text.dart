import 'package:algo_ease/core/design/shared/styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final TextAlign? textAlign;

  AppText.headingOneBold(this.text, {this.color, this.textAlign, super.key}) : style = heading1BoldStyle;
  AppText.headingOneSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = heading1SemiBoldStyle;
  AppText.headingOneMedium(this.text, {this.color, this.textAlign, super.key}) : style = heading1MediumStyle;
  AppText.headingOneRegular(this.text, {this.color, this.textAlign, super.key}) : style = heading1RegularStyle;
  AppText.headingTwoBold(this.text, {this.color, this.textAlign, super.key}) : style = heading2BoldStyle;
  AppText.headingTwoSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = heading2SemiBoldStyle;
  AppText.headingTwoMedium(this.text, {this.color, this.textAlign, super.key}) : style = heading2MediumStyle;
  AppText.headingTwoRegular(this.text, {this.color, this.textAlign, super.key}) : style = heading2RegularStyle;
  AppText.headingThreeBold(this.text, {this.color, this.textAlign, super.key}) : style = heading3BoldStyle;
  AppText.headingThreeSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = heading3SemiBoldStyle;
  AppText.headingThreeMedium(this.text, {this.color, this.textAlign, super.key}) : style = heading3MediumStyle;
  AppText.headingThreeRegular(this.text, {this.color, this.textAlign, super.key}) : style = heading3RegularStyle;

  AppText.bodyOneSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = body1SemiBoldStyle;
  AppText.bodyOneMedium(this.text, {this.color, this.textAlign, super.key}) : style = body1MediumStyle;
  AppText.bodyOneRegular(this.text, {this.color, this.textAlign, super.key}) : style = body1RegularStyle;
  AppText.bodyTwoSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = body2SemiBoldStyle;
  AppText.bodyTwoMedium(this.text, {this.color, this.textAlign, super.key}) : style = body2MediumStyle;
  AppText.bodyTwoRegular(this.text, {this.color, this.textAlign, super.key}) : style = body2RegularStyle;
  AppText.bodyThreeSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = body3SemiBoldStyle;
  AppText.bodyThreeMedium(this.text, {this.color, this.textAlign, super.key}) : style = body3MediumStyle;
  AppText.bodyThreeRegular(this.text, {this.color, this.textAlign, super.key}) : style = body3RegularStyle;

  AppText.captionOneSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = caption1SemiBoldStyle;
  AppText.captionOneMedium(this.text, {this.color, this.textAlign, super.key}) : style = caption1MediumStyle;
  AppText.captionOneRegular(this.text, {this.color, this.textAlign, super.key}) : style = caption1RegularStyle;
  AppText.captionTwoSemiBold(this.text, {this.color, this.textAlign, super.key}) : style = caption2SemiBoldStyle;
  AppText.captionTwoMedium(this.text, {this.color, this.textAlign, super.key}) : style = caption2MediumStyle;
  AppText.captionTwoRegular(this.text, {this.color, this.textAlign, super.key}) : style = caption2RegularStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(color: color),
      textAlign: textAlign,
    );
  }
}
