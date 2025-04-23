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
              onPressed: () {
                VakaRoute.navAdd();
              },
              icon: const Icon(
                Icons.add_circle_outline_outlined,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
    );
  }
}
