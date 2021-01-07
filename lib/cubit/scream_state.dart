part of 'scream_cubit.dart';

@immutable
abstract class ScreamState {
  const ScreamState();
}

class ScreamInitial extends ScreamState {
  const ScreamInitial();
}

class ScreamLoading extends ScreamState {
  const ScreamLoading();
}
class AddNewScream extends ScreamState{
  final Scream scream;

  AddNewScream(this.scream);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddNewScream &&
          runtimeType == other.runtimeType &&
          scream == other.scream;

  @override
  int get hashCode => scream.hashCode;
}
class ScreamLoaded extends ScreamState {
  final List<Scream> scream;

  ScreamLoaded(this.scream);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreamLoaded &&
          runtimeType == other.runtimeType &&
          scream == other.scream;

  @override
  int get hashCode => scream.hashCode;
}

class ScreamError extends ScreamState {
  final String message;

  ScreamError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreamError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
