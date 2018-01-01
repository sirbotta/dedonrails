module Characters
  class MyCharactersController < ProtectedController

    def index
      @characters = Character.where(user_id: current_user.id)
    end
  end
end