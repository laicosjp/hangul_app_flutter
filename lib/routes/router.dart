import '/resources/pages/withdrawal_page.dart';
import '/resources/pages/result_page.dart';
import '/resources/pages/general_announcement_page.dart';
import '/resources/pages/announcements_page.dart';
import '/resources/pages/quiz_page.dart';
import '/resources/pages/auth_page.dart';
import '/resources/pages/policy_page.dart';
import '/resources/pages/course_page.dart';
import '/resources/pages/courses_page.dart';
import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* App Router
|--------------------------------------------------------------------------
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.20.0/router
|-------------------------------------------------------------------------- */

appRouter() => nyRoutes((router) {
      router.route(
        HomePage.path,
        (context) => HomePage(),
        authPage: true,
        transition: PageTransitionType.fade,
      );

      // Add your routes here

      // router.route(NewPage.path, (context) => NewPage(), transition: PageTransitionType.fade);

      // Example using grouped routes
      // router.group(() => {
      //   "route_guards": [AuthRouteGuard()],
      //   "prefix": "/dashboard"
      // }, (router) {
      //
      //   router.route(AccountPage.path, (context) => AccountPage());
      // });
      router.route(CoursesPage.path, (context) => CoursesPage());
      router.route(
        CoursePage.path,
        (context) => CoursePage(),
        transition: PageTransitionType.fade,
      );
      router.route(PolicyPage.path, (context) => PolicyPage());
      router.route(AuthPage.path, (context) => AuthPage(), initialRoute: true);
      router.route(
        AnnouncementsPage.path,
        (context) => AnnouncementsPage(),
        transition: PageTransitionType.fade,
      );
      router.route(
        QuizPage.path,
        (context) => QuizPage(),
        transition: PageTransitionType.fade,
      );
      router.route(
        GeneralAnnouncementPage.path,
        (context) => GeneralAnnouncementPage(),
      );
      router.route(ResultPage.path, (context) => ResultPage());
      router.route(WithdrawalPage.path, (context) => WithdrawalPage());
    });
