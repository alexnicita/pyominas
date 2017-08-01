from functools import wraps
def my_decorator(f):
  @wraps(f)
  def wrapper(*args, **kwds):
    print 'Calling decorated function: '+f.__name__
    return f(*args, **kwds)
  return wrapper

@my_decorator
def example():
  print 'Called example function'
