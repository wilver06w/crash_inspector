part of 'package:crash_inspector/src/features/add/presentation/page.dart';

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
              S.current.addNewSource,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.addNewSourceOptions,
              ),
              Expanded(
                child: BlocBuilder<BlocOrders, OrdersState>(
                  builder: (context, state) {
                    final listArchetype = state.model.listArchetype ?? [];

                    return ListView.builder(
                      itemCount: listArchetype.length,
                      itemBuilder: (context, index) {
                        final item = listArchetype[index];
                        return MyCard(
                          data: item,
                          onTapDelete: () {},
                          onTap: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  S.current.detailArchetype(
                                    item.archetypeName,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
