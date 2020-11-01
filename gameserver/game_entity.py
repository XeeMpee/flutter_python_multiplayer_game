class GameEntity:
    entityType = "unknown_type"
    id = 0
    x = 0.0
    y = 0.0

    def __init__(self, entityType, id, x, y):
        self.entityType = entityType
        self.id = id
        self.x = x
        self.y = y

    def convertToDict(self):
        return {
            "type": self.entityType,
            "id" : self.id,
            "x": self.x,
            "y": self.y
        }

    @staticmethod
    def createFromDict(data : dict):
        gameEntity = GameEntity(data["type"], data["id"], data["x"], data["y"])
        return gameEntity
        