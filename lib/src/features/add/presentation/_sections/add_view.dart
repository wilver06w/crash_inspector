part of 'package:crash_inspector/src/features/add/presentation/page.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.current.addNewSource,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SourceDropdown(),
                const SizedBox(height: 24),
                if (state.model.selectedSource == 'Sentry') ...[
                  const SentryInputs(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class SourceDropdown extends StatelessWidget {
  const SourceDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.selectCrashSource,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: state.model.selectedSource,
                  isExpanded: true,
                  hint: Text(
                    S.current.selectASource,
                  ),
                  items: state.model.sources?.map((String source) {
                    return DropdownMenuItem<String>(
                      value: source,
                      child: Text(source),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<AddBloc>().add(
                            UpdateSelectedSourceEvent(selectedSource: newValue),
                          );
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SentryInputs extends StatelessWidget {
  const SentryInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SentryInputField(
              label: S.current.organizationId,
              value: state.model.sentryOrganizationId,
              onChanged: (value) {
                context.read<AddBloc>().add(
                      UpdateSentryOrganizationIdEvent(organizationId: value),
                    );
              },
            ),
            const SizedBox(height: 16),
            SentryInputField(
              label: S.current.projectId,
              value: state.model.sentryProjectId,
              onChanged: (value) {
                context.read<AddBloc>().add(
                      UpdateSentryProjectIdEvent(projectId: value),
                    );
              },
            ),
            const SizedBox(height: 16),
            SentryInputField(
              label: S.current.token,
              value: state.model.sentryToken,
              onChanged: (value) {
                context.read<AddBloc>().add(
                      UpdateSentryTokenEvent(token: value),
                    );
              },
              isPassword: true,
            ),
            const SizedBox(height: 16),
            const SaveButton(),
          ],
        );
      },
    );
  }
}

class SentryInputField extends StatelessWidget {
  const SentryInputField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.isPassword = false,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prefs = Modular.get<Preferences>();
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state.model.isFormFilledCompleted
                ? () {
                    final config = SentryConfig(
                      organizationId: state.model.sentryOrganizationId,
                      projectId: state.model.sentryProjectId,
                      token: state.model.sentryToken,
                    );

                    prefs.sentryConfig = config;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          S.current.savingConfiguration,
                        ),
                      ),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              S.current.saveConfiguration,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
