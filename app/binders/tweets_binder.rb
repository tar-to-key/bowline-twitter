class TweetsBinder < Bowline::Binders::Collection
  bind Tweet

  class << self
    def initial
      klass.all
    end

    def update(status)
      Bowline::Desktop::App.busy(true)
      klass.update(status)
      Bowline::Desktop::App.busy(false)
    end

    def refresh()
      Bowline::Desktop::App.busy(true)
      klass.refresh()
      Bowline::Desktop::App.busy(false)
    end

  end
end
