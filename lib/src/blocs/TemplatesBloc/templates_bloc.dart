import '../bloc_barrel.dart';
import 'package:cv_ez/src/models/Template.dart';
import 'package:firebase_database/firebase_database.dart';

class TemplatesBloc extends Bloc<TemplatesEvent, TemplatesState> {
  TemplatesBloc() : super(TemplatesInitial()) {
    on<TakeTemplatesURL>((event, emit) {
      emit(TemplatesIsLoading(isLoading: true));
      final future = _fetchTemplates();

      future.whenComplete(() => emit(TemplatesIsLoading(isLoading: false)));
    });
  }

  Future<void> _fetchTemplates() async {
    try {
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Templates");
      List<Template> templates = [];

      await databaseReference.onValue.first.then((event) {
        DataSnapshot dataSnapshot = event.snapshot;
        Map<dynamic, dynamic>? values = dataSnapshot.value as Map?;
        values?.forEach((key, values) {
          Template template = Template(
              templateName: values["templateName"].toString(),
              url: values["url"].toString()
          );
          templates.add(template);
        });
        templates.sort((a, b) {
          final nameA = int.parse(a.templateName.replaceAll(RegExp(r'[^0-9]'), ''));
          final nameB = int.parse(b.templateName.replaceAll(RegExp(r'[^0-9]'), ''));
          return nameA.compareTo(nameB);
        });
      });

      if (templates.isNotEmpty) {
        emit(TemplatesSuccessState(templates));
      } else {
        emit(const TemplatesFailureState('No data found.'));
      }
    } catch (e) {
      emit(const TemplatesFailureState('Failed to fetch data.'));
    }
  }
}
