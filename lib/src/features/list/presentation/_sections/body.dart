part of 'package:crash_inspector/src/features/list/presentation/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Preferences prefs = Modular.get<Preferences>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'ID: ${prefs.selectedSentryConfig?.organizationId}',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<BlocList, ListState>(
          builder: (BuildContext context, ListState state) {
            final List<ErrorsModel>? listErrors = state.model.listErrorsModel;

            return Column(
              children: <Widget>[
                if (listErrors != null && listErrors.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: listErrors.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ErrorsModel config = listErrors[index];
                        return ErrorItem(
                          error: config,
                          onTap: () => VakaRoute.navDetail(config),
                        );
                      },
                    ),
                  )
                else
                  Expanded(
                    child: Center(
                      child: Text(
                        S.current.noSentryConfigs,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
