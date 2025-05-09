part of 'package:crash_inspector/src/features/home/presentation/page.dart';

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
              S.current.crashInspector,
            ),
            IconButton(
              onPressed: () async {
                final bool result = await VakaRoute.navAdd() ?? false;
                if (result) {
                  if (context.mounted) {
                    context.read<BlocHome>().add(
                          const GetSentryConfigsEvent(),
                        );
                  }
                }
              },
              icon: const Icon(
                Icons.add_circle_outline_outlined,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<BlocHome, HomeState>(
          builder: (BuildContext context, HomeState state) {
            final List<SentryConfigModel> sentryConfigs =
                state.model.sentryConfigs;

            return Column(
              children: <Widget>[
                if (sentryConfigs.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: sentryConfigs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final SentryConfigModel config = sentryConfigs[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: ListTile(
                            onTap: () {
                              prefs.selectedSentryConfigIndex = index;
                              final SentryConfig? value =
                                  prefs.selectedSentryConfig;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(value?.organizationId ?? ''),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              VakaRoute.navListErrors();
                            },
                            title: Text(
                              '${S.current.organizationId}: ${UtilGlobals.maskString(config.organizationId)}',
                            ),
                            subtitle: Text(
                              '${S.current.projectId}: ${UtilGlobals.maskString(config.projectId)}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                context.read<BlocHome>().add(
                                      RemoveSentryConfigEvent(index: index),
                                    );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                else
                  Expanded(
                    child: Center(
                      child: Text(S.current.noSentryConfigs),
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
