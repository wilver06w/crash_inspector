part of 'package:effective_error_handling/src/features/home/presentation/page.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.onTap,
    required this.onTapDelete,
    required this.data,
  });
  final Archetype data;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  data.archetypeName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              IconButton(
                onPressed: onTapDelete,
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.greenAccent,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
