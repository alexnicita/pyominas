from idlpy import IDL

class attrtest(object):
  def __getattr__(self,name):
    print name
    print type(name)
    return help()

