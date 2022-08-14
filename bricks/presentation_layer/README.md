# 🧱 Presentation Layer

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A brick to create a presentation layer by features with selected state management (current [`bloc`][1], [`cubit`][1], [`get`][5]).

## 🚧 Requirements

Make sure you have the libraries of state management you want to use, for example: `bloc` and `cubit`, you have the [`bloc`][1] or [`flutter_bloc`][2] ([`equatable`][3] if you want to use `Equatable`) libraries inside your `pubspec.yaml` file.

## 🚀 Usage

### Full command:

```sh
mason make presentation_layer -o ./output-path --name name --stm bloc/cubit/getx
```

### Command:

```sh
mason make presentation_layer
```

## ✨ Variables

| Variable | Description                                  | Default | Type     |
| -------- | -------------------------------------------- | ------- | -------- |
| `name`   | Presentation Layer name                      | `Home`  | `string` |
| `stm`    | State Management (current bloc, cubit, getx) |         | `enum`   |

## 📦 Output

### Generated folder architecture with name `home` and `bloc` for state management:

    .
    ├── home
    │   ├── bloc
    │   │   ├── home_bloc.dart
    │   │   ├── home_event.dart
    │   │   └── home_state.dart
    │   ├── view
    │   │   └── home_page.dart (home_page.dart has Page-View pattern)
    │   ├── widget
    │   │   └── .gitkeep
    │   └── home.dart
    └── ...

### Generated folder architecture with name is `home` and `cubit` for state management:

    .
    ├── home
    │   ├── cubit
    │   │   ├── home_cubit.dart
    │   │   └── home_state.dart
    │   ├── view
    │   │   └── home_page.dart (home_page.dart has Page-View pattern)
    │   ├── widget
    │   │   └── .gitkeep
    │   └── home.dart
    └── ...

### Generated folder architecture with name is `home` and `getx` for state management:

    .
    ├── home
    │   ├── binding
    │   │   └── home_binding.dart
    │   ├── controller
    │   │   └── home_controller.dart
    │   ├── view
    │   │   └── home_page.dart (home_page.dart using `GetView<HomeController>`)
    │   ├── widget
    │   │   └── .gitkeep
    │   └── home.dart
    └── ...

[1]: https://pub.dev/packages/bloc
[2]: https://pub.dev/packages/flutter_bloc
[3]: https://pub.dev/packages/equatable
[4]: https://pub.dev/packages/provider
[5]: https://pub.dev/packages/get
[6]: https://pub.dev/packages/flutter_riverpod
