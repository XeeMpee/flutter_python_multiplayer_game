import game_entity

class EntitiesManager:
    __enitities = list()

    def update(self, entities : list):
        for entity in entities:
            for storedEntity in self.__enitities:
                if storedEntity.entityId == entity.entityId:
                    self.__enitities[self.__enitities.index(storedEntity)] = entity
                    print(f'Entity "{entity.entityId}" updated: [x: {entity.x}, y: {entity.y}]')
                    return
            self.__enitities.append(entity)
            print(f'New entity "{entity.entityId}" updated: [x: {entity.x}, y: {entity.y}]')
    
    def removeEntity(self, id : str):
        for entity in self.__enitities:
           entity.id == id if self.__enitities.remove(entity) else None

    def getAll(self):
        return self.__enitities
