import idlpy

class ominas(idlpy.IDL):
  # Override the magic method for getattr for an IDL object
  # Note: This will not override getattr for the class
    def __getattr__(self, attr):
        """
        Retrieve a property value or call a method on the IDL object.

        For example:
        >>> p = IDL.plot(test=1, buffer=1)
        >>> p.color
        array([0, 0, 0], dtype=uint8)
        >>> result = p.copywindow()
        >>> result.shape   # doctest: +ELLIPSIS
        (512..., 640..., 3...)
        >>> p.close()
        """
        # For internal Python attributes, just call our superclass
        if (attr[0] == '_'):
            return getattr(super(IDL, self), attr)

        #*** print("instance __getattr__: " + attr)

        isMethod = pyidl.callFunction("Obj_HasMethod", (self, attr,))

        if (isMethod):
            # A generic wrapper that can call an IDL method.
            def wrapper(*args, **kw):
                #*** print "%s%s%s" % (attr, args, kw)
                args = list(args)
                args.insert(0, self.hvid)
                args = tuple(args)
                return pyidl.callMethod(attr, args, kw)
            return wrapper
        else:
            # otherwise retrieve the property from the IDL object
            args = (self.hvid, attr)
            result = pyidl.callMethod("GetPropByName", args)
            return result


