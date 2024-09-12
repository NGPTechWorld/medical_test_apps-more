import 'package:medical_test/lib/core/utils/enums/pecialization_enume.dart';

class MedicalSpecializationController {
  static String getSpecializationNameInArabic(
      MedicalSpecialization specialization) {
    switch (specialization) {
      case MedicalSpecialization.cardiology:
        return 'أمراض القلب';
      case MedicalSpecialization.dermatology:
        return 'الأمراض الجلدية';
      case MedicalSpecialization.neurology:
        return 'طب الأعصاب';
      case MedicalSpecialization.pediatrics:
        return 'طب الأطفال';
      case MedicalSpecialization.radiology:
        return 'الأشعة';
      case MedicalSpecialization.surgery:
        return 'الجراحة';
      case MedicalSpecialization.oncology:
        return 'الأورام';
      case MedicalSpecialization.psychiatry:
        return 'الطب النفسي';
      case MedicalSpecialization.orthopedics:
        return 'جراحة العظام';
      case MedicalSpecialization.obstetricsGynecology:
        return 'أمراض النساء والتوليد';
      case MedicalSpecialization.ophthalmology:
        return 'طب العيون';
      case MedicalSpecialization.gastroenterology:
        return 'أمراض الجهاز الهضمي';
      case MedicalSpecialization.nephrology:
        return 'أمراض الكلى';
      case MedicalSpecialization.pulmonology:
        return 'أمراض الرئة';
      case MedicalSpecialization.hematology:
        return 'أمراض الدم';
      default:
        return 'تخصص غير معروف';
    }
  }

  static List<List<MedicalSpecialization>> chunkSpecializations(int chunkSize) {
    List<MedicalSpecialization> specializations = MedicalSpecialization.values;
    List<List<MedicalSpecialization>> chunks = [];

    for (var i = 0; i < specializations.length; i += chunkSize) {
      chunks.add(specializations.sublist(
          i,
          i + chunkSize > specializations.length
              ? specializations.length
              : i + chunkSize));
    }

    return chunks;
  }
}
