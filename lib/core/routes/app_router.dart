import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ahwa_manager/core/routes/routes.dart';
import 'package:simple_ahwa_manager/features/analysis/views/sales_report_screen.dart';
import 'package:simple_ahwa_manager/features/dashboard/views/dashboard_screen.dart';

import '../../features/dashboard/views/add_order_screen.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: Routes.dashboard,
          builder: (context, state) => const DashboardScreen(),
          routes: _buildSectionsRoutes(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => _buildErrorPage(context, state),
);

/// Builds the feature routes for the portfolio sections.
///
/// Returns a list of GoRoute objects for each feature page.
/// This method separates route creation logic for better maintainability.
List<GoRoute> _buildSectionsRoutes() {
  return [
    GoRoute(
      path: Routes.addOrder,
      builder: (context, state) => const AddOrderScreen(),
    ),
    GoRoute(
      path: Routes.salesReport,
      builder: (context, state) => const SalesReportScreen(),
    ),
  ];
}

/// Builds an error page for handling 404 and other routing errors.
///
/// [context] - The build context
/// [state] - The router state containing error information
/// Returns a widget representing the error page
Widget _buildErrorPage(BuildContext context, GoRouterState state) {
  return Scaffold(
    appBar: AppBar(title: const Text('Page Not Found')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Page not found: ${state.uri.path}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go(Routes.dashboard),
            child: const Text('Go DashBoard'),
          ),
        ],
      ),
    ),
  );
}
