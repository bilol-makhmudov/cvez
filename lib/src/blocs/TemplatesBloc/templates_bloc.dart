import '../bloc_barrel.dart';
import 'package:cv_ez/src/models/Template.dart';
import 'package:firebase_database/firebase_database.dart';

class TemplatesBloc extends Bloc<TemplatesEvent, TemplatesState> {
  TemplatesBloc() : super(TemplatesInitial()) {
    on<TemplatesEvent>((event, emit) {});

    on<TakeTemplatesURL>((event, emit) async {
      emit(const TemplatesIsLoading(isLoading: true));
      try {
        DatabaseReference databaseReference = FirebaseDatabase.instance.ref("Templates");
        final List<Template> templates = [];
        
        databaseReference.onValue.listen((event) {
          DataSnapshot dataSnapshot = event.snapshot;
          Map<dynamic, dynamic>? values = dataSnapshot.value as Map?;
          values?.forEach((key, values) {
            Template template = Template(
                templateName: values["templateName"].toString(),
                url: values["url"].toString()
            );
            templates.add(template);
          });
        });

        if (templates.isNotEmpty) {
          emit(TemplatesSuccessState(templates));
        } else {
          emit(const TemplatesFailureState('No data found.'));
        }
      } catch (e) {
        print(e.toString());
        emit(const TemplatesFailureState('Failed to fetch data.'));
      }
      emit(const TemplatesIsLoading(isLoading: false));
    });

  }
}
