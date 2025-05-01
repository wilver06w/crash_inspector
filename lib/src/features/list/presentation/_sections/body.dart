part of 'package:crash_inspector/src/features/list/presentation/page.dart';

class Body extends StatelessWidget {
  Body({
    super.key,
  });

  final formKeyPerson = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final prefs = Modular.get<Preferences>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ID: ${prefs.selectedSentryConfig?.organizationId}',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<BlocList, ListState>(
          builder: (context, state) {
            final listErrors = state.model.listErrorsModel;

            return Column(
              children: [
                if (listErrors != null && listErrors.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: listErrors.length,
                      itemBuilder: (context, index) {
                        final config = listErrors[index];
                        return ErrorItem(
                          error: config,
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
