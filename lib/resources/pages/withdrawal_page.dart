import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WithdrawalPage extends NyStatefulWidget {
  static const path = '/withdrawal';

  WithdrawalPage({super.key})
      : super(path, child: () => _WithdrawalPageState());
}

class _WithdrawalPageState extends NyState<WithdrawalPage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(trans("are_you_sure_to_withdrawal"))),
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            children: [
              Text("ユーザー情報、学習データが完全に削除されます。この処理は取り消せません。"),
              Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "はい、退会します。",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Gap(10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      routeTo('/home');
                    },
                    child: Text("いいえ、韓国語学習を続けます。"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
