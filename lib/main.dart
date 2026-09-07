import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// آدرس سرور پایتون لوکال شما
const String baseUrl = 'http://127.0.0.1:8000';

void main() {
  runApp(const AshkboosProApp());
}

class AshkboosProApp extends StatelessWidget {
  const AshkboosProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سامانه مشاوره دکتر اشکبوس',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        fontFamily: 'Segoe UI',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2B7CD3),
          primary: const Color(0xFF2B7CD3),
          surface: Colors.white,
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MainHolderScreen(),
      ),
    );
  }
}

class MainHolderScreen extends StatefulWidget {
  const MainHolderScreen({super.key});

  @override
  State<MainHolderScreen> createState() => _MainHolderScreenState();
}

class _MainHolderScreenState extends State<MainHolderScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ModernPlanScreen(),
    const MultiSubjectReportScreen(),
    const AnalyticsAndFeedbackScreen(),
    const StudentQAScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2B7CD3).withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          height: 70,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFE3F0FC),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (idx) => setState(() => _selectedIndex = idx),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.calendar_today_outlined, color: Color(0xFF64748B)),
              selectedIcon: Icon(Icons.calendar_month_rounded, color: Color(0xFF2B7CD3)),
              label: 'برنامه روز',
            ),
            NavigationDestination(
              icon: Icon(Icons.edit_note_outlined, color: Color(0xFF64748B)),
              selectedIcon: Icon(Icons.edit_note_rounded, color: Color(0xFF2B7CD3)),
              label: 'ثبت گزارش',
            ),
            NavigationDestination(
              icon: Icon(Icons.insights_outlined, color: Color(0xFF64748B)),
              selectedIcon: Icon(Icons.insights_rounded, color: Color(0xFF2B7CD3)),
              label: 'تحلیل و فیدبک',
            ),
            NavigationDestination(
              icon: Icon(Icons.question_answer_outlined, color: Color(0xFF64748B)),
              selectedIcon: Icon(Icons.question_answer_rounded, color: Color(0xFF2B7CD3)),
              label: 'پرسش از دکتر',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.blueGrey.shade50)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(0xFF2B7CD3), Color(0xFF63A4FF)]),
            ),
            child: const CircleAvatar(
              radius: 19,
              backgroundColor: Colors.white,
              child: Text('۲۰', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2B7CD3), fontSize: 15)),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('یاسمین رمضانی عزیز 👋', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
              Text('مشاور: دکتر خشایار اشکبوس (رتبه ۲۰)', style: TextStyle(fontSize: 11, color: Colors.blueGrey.shade400)),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFEBF4FC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text('پکیج پیشرفته', style: TextStyle(color: Color(0xFF2B7CD3), fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// ۱. صفحه برنامه روز
// -------------------------------------------------------------
class ModernPlanScreen extends StatelessWidget {
  const ModernPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF2B7CD3), Color(0xFF4A94E8)]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: const Color(0xFF2B7CD3).withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 6))],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('دوشنبه ۱۶ شهریور ۱۴۰۵', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('دور اول مطالعه 📖', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              SizedBox(height: 10),
              Text('هدف امروز: ۳ باکس اصلی مطالعه + ۵ تست استوکیومتری تشریحی', style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('باکس‌های مطالعاتی امروز', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 12),
        _buildBoxItem('ریاضی ۲', 'صفحه ۱ تا ۱۰ کتاب، مرور نکات و ۳۰ تست زماندار', '۳ ساعت', Colors.purple),
        _buildBoxItem('شیمی ۲', 'صفحه ۱ تا ۱۴، مرور واکنش‌ها، استوکیومتری و ۳۰ تست', '۲.۵ ساعت', Colors.teal),
        _buildBoxItem('برنامه ثابت روزانه', 'مرور شبانه تست‌های نشان‌دار + ۵ سوال تشریحی', '۳۰ دقیقه', Colors.orange),
      ],
    );
  }

  Widget _buildBoxItem(String title, String desc, String time, Color tagColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 4, height: 18, decoration: BoxDecoration(color: tagColor, borderRadius: BorderRadius.circular(4))),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B))),
              const Spacer(),
              Text(time, style: TextStyle(fontWeight: FontWeight.bold, color: tagColor, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: Colors.blueGrey.shade600, fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// ۲. صفحه ثبت تفکیکی گزارش (با اتصال واقعی به پایتون)
// -------------------------------------------------------------
class SubjectReportModel {
  String subjectName;
  int studyMinutes;
  bool isTimed;
  int correct;
  int wrong;
  int unattempted;
  int doubtful;

  SubjectReportModel({
    required this.subjectName,
    this.studyMinutes = 90,
    this.isTimed = true,
    this.correct = 20,
    this.wrong = 3,
    this.unattempted = 2,
    this.doubtful = 1,
  });

  Map<String, dynamic> toJson() => {
        'subject': subjectName,
        'topic': 'مطالعه و تست روزانه',
        'study_minutes': studyMinutes,
        'is_timed': isTimed,
        'correct_count': correct,
        'wrong_count': wrong,
        'unattempted_count': unattempted,
        'doubtful_count': doubtful,
      };
}

class MultiSubjectReportScreen extends StatefulWidget {
  const MultiSubjectReportScreen({super.key});

  @override
  State<MultiSubjectReportScreen> createState() => _MultiSubjectReportScreenState();
}

class _MultiSubjectReportScreenState extends State<MultiSubjectReportScreen> {
  final List<SubjectReportModel> _subjectReports = [
    SubjectReportModel(subjectName: 'زیست شناسی ۲', studyMinutes: 150, correct: 25, wrong: 3, unattempted: 2, doubtful: 1),
    SubjectReportModel(subjectName: 'شیمی ۲', studyMinutes: 120, correct: 20, wrong: 5, unattempted: 5, doubtful: 2),
  ];

  double satisfactionScore = 8;
  bool routineDone = true;
  bool isSubmitting = false;

  // تابع ارسال به سرور پایتون
  Future<void> submitReportToServer() async {
    setState(() => isSubmitting = true);

    try {
      final url = Uri.parse('$baseUrl/reports/');
      final payload = {
        'student_id': 1, // یاسمین رمضانی
        'date': '1405-06-16',
        'satisfaction_score': satisfactionScore.toInt(),
        'routine_completed': routineDone,
        'items': _subjectReports.map((item) => item.toJson()).toList(),
      };

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      setState(() => isSubmitting = false);

      if (response.statusCode == 200) {
        final resData = jsonDecode(utf8.decode(response.bodyBytes));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${resData["message"]} | مجموع: ${resData["total_study_hours"]} ساعت مطالعه 🚀'),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطا در ثبت: ${response.statusCode}'), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      setState(() => isSubmitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطای اتصال به سرور: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('ثبت تفکیکی دروس امروز', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            ElevatedButton.icon(
              icon: const Icon(Icons.add, size: 18),
              label: const Text('افزودن درس', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEBF4FC),
                foregroundColor: const Color(0xFF2B7CD3),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  _subjectReports.add(SubjectReportModel(subjectName: 'درس جدید ${_subjectReports.length + 1}'));
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 14),

        ..._subjectReports.asMap().entries.map((entry) {
          int index = entry.key;
          SubjectReportModel item = entry.value;
          return _buildSubjectReportCard(item, index);
        }),

        const SizedBox(height: 10),

        // نمره رضایت
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('نمره شما به کیفیت مطالعه امروز:', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFFEBF4FC), borderRadius: BorderRadius.circular(10)),
                    child: Text('${satisfactionScore.toInt()} از ۱۰ ⭐', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2B7CD3))),
                  ),
                ],
              ),
              Slider(
                value: satisfactionScore,
                min: 1,
                max: 10,
                divisions: 9,
                activeColor: const Color(0xFF2B7CD3),
                onChanged: (v) => setState(() => satisfactionScore = v),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // روتین
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE2E8F0))),
          child: SwitchListTile(
            title: const Text('انجام روتین (مرور شبانه + استوکیومتری)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            value: routineDone,
            activeColor: const Color(0xFF2B7CD3),
            onChanged: (v) => setState(() => routineDone = v),
          ),
        ),
        const SizedBox(height: 20),

        // دکمه ارسال به سرور
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2B7CD3),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          onPressed: isSubmitting ? null : submitReportToServer,
          child: isSubmitting
              ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
              : const Text('ارسال گزارش شبانه برای مشاور 🚀', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
        ),
      ],
    );
  }

  Widget _buildSubjectReportCard(SubjectReportModel item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [BoxShadow(color: const Color(0xFF2B7CD3).withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: item.subjectName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B)),
                  decoration: const InputDecoration(border: InputBorder.none, hintText: 'نام درس'),
                  onChanged: (val) => item.subjectName = val,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                onPressed: _subjectReports.length > 1 ? () => setState(() => _subjectReports.removeAt(index)) : null,
              ),
            ],
          ),
          const Divider(height: 10),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.timer_outlined, size: 18, color: Color(0xFF64748B)),
              const SizedBox(width: 6),
              Text('مدت مطالعه: ${item.studyMinutes} دقیقه', style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
              const Spacer(),
              ChoiceChip(
                label: Text(item.isTimed ? 'تست زماندار' : 'آموزشی', style: const TextStyle(fontSize: 11)),
                selected: item.isTimed,
                selectedColor: const Color(0xFFE3F0FC),
                onSelected: (val) => setState(() => item.isTimed = val),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildMiniCounter('صحیح:', item.correct, (v) => setState(() => item.correct = v), const Color(0xFF10B981)),
          _buildMiniCounter('غلط:', item.wrong, (v) => setState(() => item.wrong = v), const Color(0xFFEF4444)),
          _buildMiniCounter('نزده:', item.unattempted, (v) => setState(() => item.unattempted = v), const Color(0xFF94A3B8)),
          _buildMiniCounter('شک‌دار:', item.doubtful, (v) => setState(() => item.doubtful = v), const Color(0xFFF59E0B)),
        ],
      ),
    );
  }

  Widget _buildMiniCounter(String title, int count, Function(int) onChange, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
          const SizedBox(width: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: color, fontSize: 13)),
          const Spacer(),
          Container(
            height: 32,
            decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.remove, size: 14), onPressed: count > 0 ? () => onChange(count - 1) : null),
                Text('$count', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                IconButton(icon: const Icon(Icons.add, size: 14, color: Color(0xFF2B7CD3)), onPressed: () => onChange(count + 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// ۳. صفحه دریافت آنلاین تحلیل و فیدبک از سرور پایتون
// -------------------------------------------------------------
class AnalyticsAndFeedbackScreen extends StatelessWidget {
  const AnalyticsAndFeedbackScreen({super.key});

  Future<Map<String, dynamic>> fetchLiveAnalytics() async {
    final response = await http.get(Uri.parse('$baseUrl/students/1/analytics'));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    throw Exception('عدم دریافت اطلاعات');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchLiveAnalytics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('هنوز هیچ گزارشی در سرور ثبت نشده است.'));
        }

        final data = snapshot.data!;
        final subjects = (data['subjects_breakdown'] as List);

        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // فیدبک دکتر اشکبوس
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1E293B)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified_user_rounded, color: Colors.amber, size: 22),
                      SizedBox(width: 8),
                      Text('فیدبک مشاور (دکتر اشکبوس)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '«یاسمین جان، ساعات مطالعه امروز عالی بود. دقت زیست فوق‌العاده‌ست اما تست‌های زماندار شیمی نیاز به مرور فرمول‌های استوکیومتری داره.»',
                    style: TextStyle(color: Color(0xFFE2E8F0), fontSize: 13, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('آمار زنده از دیتابیس سرور', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            const SizedBox(height: 12),

            Row(
              children: [
                _buildStatBox('ساعت کل', '${data["total_study_hours"]} ساعت', const Color(0xFF2B7CD3)),
                const SizedBox(width: 10),
                _buildStatBox('دقت تست‌ها', '${data["overall_accuracy_rate"]}٪', const Color(0xFF10B981)),
                const SizedBox(width: 10),
                _buildStatBox('کل تست‌ها', '${data["total_tests"]}', const Color(0xFFF59E0B)),
              ],
            ),
            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE2E8F0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('تحلیل دروس (محاسبه‌شده با پایتون):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 16),
                  ...subjects.map((sub) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(sub['subject'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                Text('دقت: ${sub["accuracy_rate"]}٪', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2B7CD3), fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text('${sub["total_hours"]} ساعت مطالعه | ${sub["total_tests"]} تست زده شده', style: TextStyle(color: Colors.blueGrey.shade400, fontSize: 11)),
                            const SizedBox(height: 6),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: LinearProgressIndicator(
                                value: (sub['accuracy_rate'] as num) / 100,
                                minHeight: 7,
                                backgroundColor: const Color(0xFFF1F5F9),
                                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2B7CD3)),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatBox(String title, String val, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(
          children: [
            Text(val, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 11, color: Colors.blueGrey.shade400)),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// ۴. صفحه پرسش و پاسخ
// -------------------------------------------------------------
class StudentQAScreen extends StatelessWidget {
  const StudentQAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('بخش پرسش و پاسخ (به زودی)', style: TextStyle(color: Colors.blueGrey)));
  }
}