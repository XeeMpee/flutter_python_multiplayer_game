class Entity:
    entityId = None
    x = None
    y = None
    
    def toProto(self):
        raise NotImplementedError
