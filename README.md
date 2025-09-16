<div align="center">

# Simple Ahwa Manager

Lightweight café/ahwa order manager built with Flutter. Create orders, mark them served, and view simple sales analytics across platforms.

</div>

---

## Features

- Dashboard listing pending orders with customer, drink, and notes
- Add Order form (name, drink type, special instructions)
- Sales Report with total served and top-selling drinks
- Clean, feature-based project structure
- GoRouter-based navigation

## Tech Stack

- Flutter (Material 3)
- GoRouter for navigation
- In-memory `OrdersStore` (ValueNotifier) for app state

Note: The project is designed to be easily upgraded to BLoC/Freezed or persistent stores (Hive/Shared Preferences) later.

## Architecture

Feature-first (clean architecture-inspired) structure:

- `core/` shared modules
  - `core/models/` domain models (e.g., `order.dart`)
  - `core/data/` lightweight shared stores (e.g., `orders_store.dart`)
  - `core/routes/` router and route names
- `features/` grouped by capability
  - `dashboard/` (views + widgets)
  - `analysis/` (views + widgets)

## Routing

Routes are centralized in `core/routes/routes.dart` and registered in `core/routes/app_router.dart`.

- `/` → `DashboardScreen`
- `/addOrder` → `AddOrderScreen`
- `/salesReport` → `SalesReportScreen`

Use `context.go(Routes.addOrder)` or `context.go(Routes.salesReport)` to navigate.

## Contributing

1. Fork the repo
2. Create a feature branch: `git checkout -b feat/your-feature`
3. Commit changes: `git commit -m "feat: add your feature"`
4. Push and open a PR

