part of 'package:crash_inspector/src/features/detail/presentation/page.dart';

class ErrorDetail extends StatelessWidget {
  const ErrorDetail({
    super.key,
    required this.error,
  });

  final ErrorsModel error;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd().add_Hm();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          error.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: '🧠 General',
            ),
            InfoRow(title: 'Title', value: error.title),
            InfoRow(title: 'Issue Type', value: error.issueType),
            InfoRow(title: 'Issue Category', value: error.issueCategory),
            InfoRow(title: 'Level', value: error.level),
            InfoRow(
                title: 'Status', value: '${error.status} / ${error.substatus}'),
            const SizedBox(height: 16),
            const SectionTitle(title: '📁 Proyecto'),
            InfoRow(title: 'Name', value: error.project.name),
            InfoRow(title: 'Slug', value: error.project.slug),
            InfoRow(title: 'Platform', value: error.project.platform),
            const SizedBox(height: 16),
            const SectionTitle(title: '⚙️ Técnicos'),
            InfoRow(title: 'Culprit', value: error.culprit),
            InfoRow(title: 'Filename', value: error.metadata.filename),
            InfoRow(title: 'Function', value: error.metadata.function),
            InfoRow(
                title: 'SDK',
                value:
                    '${error.metadata.sdk.name} (${error.metadata.sdk.nameNormalized})'),
            InfoRow(
                title: 'Initial Priority',
                value: error.metadata.initialPriority.toString()),
            InfoRow(
                title: 'Display With Tree Label',
                value: error.metadata.displayTitleWithTreeLabel.toString()),
            InfoRow(
                title: 'In-App Frame Mix', value: error.metadata.inAppFrameMix),
            InfoRow(title: 'Value', value: error.metadata.value),
            InfoRow(
                title: 'Assigned To',
                value: error.assignedTo?.toString() ?? 'N/A'),
            const SizedBox(height: 16),
            const SectionTitle(title: '🔗 IDs y Vínculos'),
            InfoRow(title: 'ID', value: error.id),
            InfoRow(
                title: 'Share ID', value: error.shareId?.toString() ?? 'N/A'),
            InfoRow(title: 'Short ID', value: error.shortId),
            InfoRow(title: 'Permalink', value: error.permalink),
            const SizedBox(height: 16),
            const SectionTitle(title: '📊 Estadísticas'),
            InfoRow(title: 'Count', value: error.count),
            InfoRow(title: 'User Count', value: error.userCount.toString()),
            InfoRow(title: 'Comments', value: error.numComments.toString()),
            InfoRow(
                title: 'First Seen', value: dateFormat.format(error.firstSeen)),
            InfoRow(
                title: 'Last Seen', value: dateFormat.format(error.lastSeen)),
            const SizedBox(height: 16),
            const SectionTitle(title: '🚩 Flags'),
            Wrap(
              spacing: 10,
              runSpacing: 6,
              children: [
                FlagChip(title: 'Public', value: error.isPublic),
                FlagChip(title: 'Bookmarked', value: error.isBookmarked),
                FlagChip(title: 'Subscribed', value: error.isSubscribed),
                FlagChip(title: 'Seen', value: error.hasSeen),
                FlagChip(title: 'Unhandled', value: error.isUnhandled),
              ],
            ),
            const SizedBox(height: 16),
            if (error.metadata.seerSimilarity != null) ...[
              const SectionTitle(title: '🧬 Seer Similarity'),
              InfoRow(
                  title: 'Model Version',
                  value: error.metadata.seerSimilarity!.similarityModelVersion),
              InfoRow(
                  title: 'Request Hash',
                  value: error.metadata.seerSimilarity!.requestHash),
            ],
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    this.value,
  });

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(value ?? '—'),
          ),
        ],
      ),
    );
  }
}

class FlagChip extends StatelessWidget {
  const FlagChip({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        value ? Icons.check_circle : Icons.cancel,
        color: value ? Colors.green : Colors.red,
        size: 16,
      ),
      label: Text(title),
      backgroundColor: value ? Colors.green.shade50 : Colors.red.shade50,
    );
  }
}
