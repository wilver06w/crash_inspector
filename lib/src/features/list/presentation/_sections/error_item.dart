part of 'package:crash_inspector/src/features/list/presentation/page.dart';

class ErrorItem extends StatelessWidget {
  const ErrorItem({
    super.key,
    required this.error,
    required this.onTap,
  });
  final ErrorsModel error;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd().add_Hm();

    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                UtilGlobals.getErrorIcon(
                  error.level,
                ),
                color: UtilGlobals.getErrorColor(
                  error.level,
                ),
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      error.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${S.current.culprit}: ${error.culprit}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${S.current.project}: ${error.project.name} • ${error.platform}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${S.current.lastSeen}: ${dateFormat.format(error.lastSeen)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (error.isUnhandled) ...[
                const SizedBox(width: 8),
                const Icon(Icons.warning_amber_rounded, color: Colors.orange),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
