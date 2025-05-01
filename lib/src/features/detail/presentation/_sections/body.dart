part of 'package:crash_inspector/src/features/detail/presentation/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.error,
  });

  final ErrorsModel error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              UtilGlobals.recortText(
                error.title,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<BlocDetail, DetailState>(
          builder: (context, state) {
            final listErrors = state.model.listErrorsModel;

            return Column(
              children: [
                if (listErrors != null && listErrors.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: listErrors.length,
                      itemBuilder: (context, index) {
                        return const SizedBox.shrink();
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
