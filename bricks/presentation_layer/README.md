# 🧱 Presentation Layer

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A brick to create a presentation layer by features with selected state management (current flutter_bloc)

## 🚧 Requirements

Make sure you have the libraries of state management you want to use, current is `bloc`, you have the [`bloc`][2] and [`flutter_bloc`][3] libraries inside your `pubspec.yaml` file.

## 🚀 Usage

```sh
mason make presentation_layer -o ./output-path --name presentation_layer_name
```

## ✨ Variables

| Variable | Description                                                               | Default | Type     |
| -------- | ------------------------------------------------------------------------- | ------- | -------- |
| `name`   | Presentation Layer name (current using flutter_bloc for state management) | `Home`  | `string` |

## Output 📦

Generated folder architecture with name `home`:

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

[1]: https://github.com/felangel/bloc
[2]: https://github.com/felangel/bloc/tree/master/packages/bloc
[3]: https://github.com/felangel/bloc/tree/master/packages/flutter_bloc
