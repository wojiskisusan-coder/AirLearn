import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AirLearnApp());
}

class AirLearnApp extends StatelessWidget {
  const AirLearnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AirLearn AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class Translations {
  static const Map<String, Map<String, String>> translations = {
    'en': {
      'title': 'AirLearn AI',
      'subtitle': "Bangladesh's First Free AI-Powered Learning Platform",
      'discover': 'Discover Courses',
      'myProgress': 'My Progress',
      'recommended': 'Recommended For You',
      'allCategories': 'All Categories',
      'startLearning': 'Start Learning',
      'continueLearn': 'Continue',
      'hours': 'hours',
      'students': 'students',
      'searchPlaceholder': 'Search 150+ courses...',
      'languages': '20+ Languages',
      'modalities': '5 Learning Modalities',
      'free': 'Completely Free',
      'openSource': 'Open Source',
    },
    'bn': {
      'title': 'এয়ারলার্ন এআই',
      'subtitle': 'বাংলাদেশের প্রথম বিনামূল্যে এআই-চালিত শিক্ষা প্ল্যাটফর্ম',
      'discover': 'কোর্স আবিষ্কার করুন',
      'myProgress': 'আমার অগ্রগতি',
      'recommended': 'আপনার জন্য সুপারিশকৃত',
      'allCategories': 'সমস্ত বিভাগ',
      'startLearning': 'শিক্ষা শুরু করুন',
      'continueLearn': 'চালিয়ে যান',
      'hours': 'ঘন্টা',
      'students': 'শিক্ষার্থী',
      'searchPlaceholder': '১৫০+ কোর্স সার্চ করুন...',
      'languages': '২০+ ভাষা',
      'modalities': '৫টি শেখার পদ্ধতি',
      'free': 'সম্পূর্ণ বিনামূল্যে',
      'openSource': 'ওপেন সোর্স',
    }
  };

  static String get(String key, String language) {
    return translations[language]?[key] ?? key;
  }
}

class CourseModel {
  final int id;
  final String titleEn;
  final String titleBn;
  final String category;
  final String instructor;
  final int hours;
  final int students;
  final double rating;
  final Color gradientStart;
  final Color gradientEnd;
  final int progress;

  CourseModel({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.category,
    required this.instructor,
    required this.hours,
    required this.students,
    required this.rating,
    required this.gradientStart,
    required this.gradientEnd,
    required this.progress,
  });

  String getTitle(String language) => language == 'en' ? titleEn : titleBn;
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  String _language = 'en';
  String _selectedCategory = 'all';
  String _searchQuery = '';
  late AnimationController _fadeController;
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  final List<CourseModel> courses = [
    CourseModel(
      id: 1,
      titleEn: 'Python for Beginners',
      titleBn: 'শুরুকারীদের জন্য পাইথন',
      category: 'tech',
      instructor: 'MahmudGPT',
      hours: 12,
      students: 3420,
      rating: 4.8,
      gradientStart: const Color(0xFF60A5FA),
      gradientEnd: const Color(0xFF2563EB),
      progress: 45,
    ),
    CourseModel(
      id: 2,
      titleEn: 'Bengali Literature Masterclass',
      titleBn: 'বাংলা সাহিত্য মাস্টারক্লাস',
      category: 'languages',
      instructor: 'Dr. Karim',
      hours: 8,
      students: 2150,
      rating: 4.9,
      gradientStart: const Color(0xFFFCD34D),
      gradientEnd: const Color(0xFFF97316),
      progress: 72,
    ),
    CourseModel(
      id: 3,
      titleEn: 'Advanced Mathematics',
      titleBn: 'উন্নত গণিত',
      category: 'math',
      instructor: 'Prof. Rahman',
      hours: 20,
      students: 1890,
      rating: 4.7,
      gradientStart: const Color(0xFFA78BFA),
      gradientEnd: const Color(0xFF7C3AED),
      progress: 28,
    ),
    CourseModel(
      id: 4,
      titleEn: 'Physics Fundamentals',
      titleBn: 'পদার্থবিজ্ঞান ভিত্তি',
      category: 'science',
      instructor: 'Dr. Islam',
      hours: 15,
      students: 2340,
      rating: 4.8,
      gradientStart: const Color(0xFF06B6D4),
      gradientEnd: const Color(0xFF2563EB),
      progress: 0,
    ),
    CourseModel(
      id: 5,
      titleEn: 'World History 101',
      titleBn: 'বিশ্ব ইতিহাস ১০১',
      category: 'history',
      instructor: 'Prof. Ahmed',
      hours: 10,
      students: 1560,
      rating: 4.6,
      gradientStart: const Color(0xFFFB7185),
      gradientEnd: const Color(0xFFE11D48),
      progress: 15,
    ),
    CourseModel(
      id: 6,
      titleEn: 'Digital Marketing Essentials',
      titleBn: 'ডিজিটাল মার্কেটিং মূল বিষয়',
      category: 'business',
      instructor: 'Sarah Khan',
      hours: 6,
      students: 4120,
      rating: 4.9,
      gradientStart: const Color(0xFF4ADE80),
      gradientEnd: const Color(0xFF059669),
      progress: 0,
    ),
    CourseModel(
      id: 7,
      titleEn: 'Web Development Bootcamp',
      titleBn: 'ওয়েব ডেভেলপমেন্ট বুটক্যাম্প',
      category: 'tech',
      instructor: 'MahmudGPT',
      hours: 25,
      students: 5640,
      rating: 4.8,
      gradientStart: const Color(0xFF818CF8),
      gradientEnd: const Color(0xFF6366F1),
      progress: 60,
    ),
    CourseModel(
      id: 8,
      titleEn: 'Classical Art Appreciation',
      titleBn: 'ক্লাসিক্যাল শিল্প প্রশংসা',
      category: 'art',
      instructor: 'Dr. Habib',
      hours: 7,
      students: 890,
      rating: 4.5,
      gradientStart: const Color(0xFFEC4899),
      gradientEnd: const Color(0xFFBE185D),
      progress: 0,
    ),
  ];

  List<String> get categories {
    final categoryMap = {
      'all': _language == 'en' ? 'All Courses' : 'সব কোর্স',
      'tech': _language == 'en' ? 'Technology' : 'প্রযুক্তি',
      'math': _language == 'en' ? 'Mathematics' : 'গণিত',
      'science': _language == 'en' ? 'Science' : 'বিজ্ঞান',
      'history': _language == 'en' ? 'History' : 'ইতিহাস',
      'languages': _language == 'en' ? 'Languages' : 'ভাষা',
      'art': _language == 'en' ? 'Arts' : 'শিল্পকলা',
      'business': _language == 'en' ? 'Business' : 'ব্যবসা',
    };
    return categoryMap.keys.toList();
  }

  List<CourseModel> get filteredCourses {
    return courses.where((course) {
      final matchesCategory =
          _selectedCategory == 'all' || course.category == _selectedCategory;
      final matchesSearch = course
          .getTitle(_language)
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  List<CourseModel> get inProgressCourses =>
      courses.where((c) => c.progress > 0).toList();

  List<CourseModel> get recommendedCourses =>
      courses.where((c) => c.progress == 0).take(3).toList();

  String get(String key) => Translations.get(key, _language);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            backgroundColor: const Color(0xFF0F172A).withOpacity(0.8),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF1E293B).withOpacity(0.8),
                      const Color(0xFF0F172A).withOpacity(0.9),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF60A5FA),
                                        Color(0xFF7C3AED),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '⚡',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) =>
                                          const LinearGradient(
                                        colors: [
                                          Color(0xFF60A5FA),
                                          Color(0xFFA78BFA),
                                          Color(0xFFFB7185),
                                        ],
                                      ).createShader(bounds),
                                      child: Text(
                                        get('title'),
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _language =
                                      _language == 'en' ? 'bn' : 'en';
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                child: Text(
                                  _language == 'en' ? 'বাংলা' : 'English',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          get('subtitle'),
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey[400],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Stats Cards
                FadeTransition(
                  opacity: _fadeController,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: StatCard(
                              label: get('languages'),
                              value: '20+',
                              icon: '🌐',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: StatCard(
                              label: get('modalities'),
                              value: '5',
                              icon: '⚡',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: StatCard(
                              label: get('free'),
                              value: '100%',
                              icon: '⭐',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search,
                          size: 20, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() => _searchQuery = value);
                          },
                          decoration: InputDecoration(
                            hintText: get('searchPlaceholder'),
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // In Progress Section
                if (inProgressCourses.isNotEmpty) ...[
                  Text(
                    get('myProgress'),
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...inProgressCourses.take(2).map((course) =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CourseProgressCard(
                          course: course,
                          language: _language,
                        ),
                      )),
                  const SizedBox(height: 20),
                ],

                // Categories
                Text(
                  get('discover'),
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((cat) {
                      final isSelected = _selectedCategory == cat;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedCategory = cat);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xFF3B82F6),
                                        Color(0xFF7C3AED),
                                      ],
                                    )
                                  : null,
                              color: isSelected
                                  ? null
                                  : Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: isSelected
                                  ? null
                                  : Border.all(
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                            ),
                            child: Text(
                              _language == 'en'
                                  ? (cat == 'all'
                                      ? 'All Courses'
                                      : cat
                                          .replaceFirst(
                                              cat[0],
                                              cat[0].toUpperCase())
                                          .replaceAll('_', ' '))
                                  : (cat == 'all'
                                      ? 'সব কোর্স'
                                      : cat),
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),

                // Course Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    return CourseCard(
                      course: course,
                      language: _language,
                      get: get,
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Recommended Section
                Text(
                  get('recommended'),
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...recommendedCourses.map((course) =>
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: RecommendedCourseCard(
                        course: course,
                        language: _language,
                        get: get,
                      ),
                    )),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String icon;

  const StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.grey[400],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final String language;
  final String Function(String) get;

  const CourseCard({
    required this.course,
    required this.language,
    required this.get,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to course detail
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [course.gradientStart, course.gradientEnd],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.play_arrow,
                      color: Colors.white, size: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.getTitle(language),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.instructor,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.grey[400],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              size: 12, color: Color(0xFFFCD34D)),
                          const SizedBox(width: 2),
                          Text(
                            '${course.rating}',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        backgroundColor: Colors.white.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        get('startLearning'),
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseProgressCard extends StatelessWidget {
  final CourseModel course;
  final String language;

  const CourseProgressCard({
    required this.course,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [course.gradientStart, course.gradientEnd],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.play_arrow, color: Colors.white, size: 32),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.getTitle(language),
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: course.progress / 100,
                    minHeight: 6,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation(
                      Color.lerp(
                        const Color(0xFF60A5FA),
                        const Color(0xFF7C3AED),
                        course.progress / 100,
                      )!,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${course.progress}% Complete',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedCourseCard extends StatelessWidget {
  final CourseModel course;
  final String language;
  final String Function(String) get;

  const RecommendedCourseCard({
    required this.course,
    required this.language,
    required this.get,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [course.gradientStart, course.gradientEnd],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.play_arrow, color: Colors.white, size: 40),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            course.getTitle(language),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                course.instructor,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, size: 14, color: Color(0xFFFCD34D)),
                  const SizedBox(width: 2),
                  Text(
                    '${course.rating}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${course.hours}h • ${course.students} students',
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              onPressed: () {},
              child: Text(
                get('startLearning'),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
