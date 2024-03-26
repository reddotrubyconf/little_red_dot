class FeaturedSpeaker < ApplicationRecord
    validates :name, presence: true
    validates :title, presence: true
    validates :display_picture, presence: true

    before_create :set_display_order

    def bump_up!
        return if display_order == 1

        previous_speaker = FeaturedSpeaker.find_by(display_order: display_order - 1)
        previous_speaker.update(display_order: display_order)
        update(display_order: display_order - 1)
    end

    def bump_down!
        return if display_order == FeaturedSpeaker.maximum(:display_order)

        next_speaker = FeaturedSpeaker.find_by(display_order: display_order + 1)
        next_speaker.update(display_order: display_order)
        update(display_order: display_order + 1)
    end

    private

    def set_display_order
        self.display_order = FeaturedSpeaker.maximum(:display_order).to_i + 1
    end
end
