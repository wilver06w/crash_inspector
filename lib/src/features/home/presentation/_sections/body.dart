part of 'package:crash_inspector/src/features/home/presentation/page.dart';

class Body extends StatelessWidget {
  Body({
    super.key,
  });

  final formKeyPerson = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.current.crashInspector,
            ),
            IconButton(
              onPressed: () async {
                final result = await VakaRoute.navAdd() ?? false;
                if (result) {
                  if (context.mounted) {
                    context.read<BlocOrders>().add(
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
        child: BlocBuilder<BlocOrders, OrdersState>(
          builder: (context, state) {
            final sentryConfigs = state.model.sentryConfigs;

            return Column(
              children: [
                if (sentryConfigs.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: sentryConfigs.length,
                      itemBuilder: (context, index) {
                        final config = sentryConfigs[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: ListTile(
                            title: Text(
                              '${S.current.organizationId}: ${UtilGlobals.maskString(config.organizationId)}',
                            ),
                            subtitle: Text(
                              '${S.current.projectId}: ${UtilGlobals.maskString(config.projectId)}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                context.read<BlocOrders>().add(
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
