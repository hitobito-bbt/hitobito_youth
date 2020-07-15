# encoding: utf-8

#  Copyright (c) 2020, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

module Youth::EventDecorator
  extend ActiveSupport::Concern

  included do
    def as_quicksearch
      { id: id, label: label_with_group, type: :event, icon: icon }
    end
  end

  private

  def icon
    if model.type.to_s == 'Event::Course'
      :book
    elsif model.type.to_s == 'Event::Camp'
      :campground
    else
      :'calendar-alt'
    end
  end
end
