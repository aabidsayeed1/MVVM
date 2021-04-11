import 'package:flutter/material.dart';

import 'package:shared_components/shared_components.dart';

import 'package:screener/home/components/list/list.component.dart';
import 'package:screener/home/templates/carousel/carousel.template.dart';
import 'package:screener/home/utils/strings.dart';
import 'package:screener/home/view_models/home.viewmodel.dart';
import 'package:screener/locator.dart';
import 'package:screener/shared/assets/image.assets.dart';
import 'package:screener/shared/components/notifier/notifier.component.dart';
import 'package:screener/shared/routes/routes.dart';
import 'package:screener/shared/services/navigation.service.dart';

import 'package:app_theme/app_theme.dart' show AppColors;

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotifierWidget<HomeViewModel>(
      builder: (_, model, child) {
        if (model.isLoading) {
          return child;
        }

        return CustomScaffold(
          enableGutter: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SpacerVertical(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _Intro(),
                ),
                SpacerVertical(32),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: CarouselTemplate(),
                ),
                SpacerVertical(64),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: _Bottom(),
                ),
                SpacerVertical(32),
              ],
            ),
          ),
        );
      },
      model: locator<HomeViewModel>(),
      child: LoadingComponent(),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const H3TextComponent(
          text: HomeStrings.title,
        ),
        const SpacerVertical(16),
        Text(
          HomeStrings.nam,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: AppColors.textGrey),
        ),
        const SpacerVertical(8),
        Row(
          children: [
            Text(
              HomeStrings.euismod,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const Spacer(),
            const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ],
        ),
        const SpacerVertical(24),
        ImageComponent(
          assetName: ImageAssets.img300.assetName,
          height: 300,
        ),
      ],
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navService = locator<NavigationService>();

    return ColumnSpacer(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacerWidget: const SpacerVertical(16),
      children: [
        Text(
          HomeStrings.bottom,
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          HomeStrings.bottomDesc,
          style: Theme.of(context).textTheme.caption,
        ),
        ListComponent(
          onPressed: () {
            navService.nav.pushNamed(NamedRoute.pellen);
          },
          text: HomeStrings.bOp1,
        ),
        ListComponent(
          onPressed: () {
            navService.nav.pushNamed(NamedRoute.fringilla);
          },
          text: HomeStrings.bOp2,
        ),
      ],
    );
  }
}
