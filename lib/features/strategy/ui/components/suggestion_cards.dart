import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/extension/string_extensions.dart';
import 'package:algo_ease/models/strategy_request.dart';
import 'package:algo_ease/models/suggestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SuggestionCards extends StatelessWidget {
  const SuggestionCards({
    super.key,
    required this.suggestions,
    required this.onTap,
  });

  final List<Suggestion> suggestions;
  final Function(StrategyRequest) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestions.length,
        itemBuilder: (ctx, index) => GestureDetector(
          onTap: () => onTap(suggestions[index].strategy),
          child: Container(
            width: 140.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: AppColors.secondaryColor, borderRadius: BorderRadius.circular(6.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset(
                  suggestions[index].title == "bullish" ? "assets/icons/bullish_icon.svg" : "assets/icons/bearish_icon.svg",
                  width: 32,
                ),
                SizedBox(height: 8.h),
                AppText.bodyThreeMedium(suggestions[index].title.capitalize()),
                SizedBox(height: 6.h),
                Expanded(
                  child: Column(
                    children: [
                      AppText.captionTwoRegular(
                        suggestions[index].desc,
                        textAlign: TextAlign.center,
                        color: AppColors.subTextColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
