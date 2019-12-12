/*
 *  A lightweight "dependency injection" container. 
 */
class Injector {
  Injector _injector;

  Injector get injector {
    _injector ??= Injector();
    return _injector;
  }
}
