abstract class NavState {
  const NavState();
}

class NavInitial extends NavState {
  final int index;
  const NavInitial({this.index = 0});
}

class NavChanged extends NavState {
  final int index;
  const NavChanged(this.index);
}
