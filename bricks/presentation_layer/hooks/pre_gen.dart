import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;

  final stm = context.vars['stm'];
  final isBloc = stm == 'bloc';
  final isCubit = stm == 'cubit';
  final isProvider = stm == 'change_notifier_provider';
  final isGetx = stm == 'getx';
  final isRiverpod = stm == 'riverpod';
  final isMobx = stm == 'mobx';

  var useEquatable = false;

  if (isBloc || isCubit) {
    useEquatable = logger.confirm(
      'Do you want to use Equatable',
      defaultValue: true,
    );
  }

  context.vars = {
    ...context.vars,
    'bloc': isBloc,
    'cubit': isCubit,
    'provider': isProvider,
    'getx': isGetx,
    'riverpod': isRiverpod,
    'mobx': isMobx,
    'equatable': useEquatable,
  };

  logger
      .progress(
        'Generating {{name}} with {{stm}}${useEquatable ? ' with Equatable' : ''}',
      )
      .complete();
}
