enum Routes {
  home(path: '/home', name: 'home'),
  details(path: '/details', name: 'details');

  final String path;
  final String name;

  const Routes({required this.path, required this.name});
}
