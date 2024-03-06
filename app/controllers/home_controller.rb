class HomeController < ApplicationController
    def show
        @weighings = Weighing.limit(10).order(created_at: :desc)
    end
end
