class PlayerSerializer 
    def initialize(player_obj)
        @player = player_obj
    end

    def to_serialized_json
        options = {
            except: [:created_at, :updated_at]
        }
        @player.to_json(options)
    end
end