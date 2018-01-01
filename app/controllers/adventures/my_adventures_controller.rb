module Adventures
  class MyAdventuresController < ProtectedController

    def index
      @adventures = Adventure.where(dm_id: current_user.id)
    end
  end
end
