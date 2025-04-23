part of 'package:effective_error_handling/src/features/home/presentation/page.dart';

class Body extends StatelessWidget {
  Body({
    super.key,
  });

  final formKeyPerson = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(16),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                                  S.current.detailOrderNumber(
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
