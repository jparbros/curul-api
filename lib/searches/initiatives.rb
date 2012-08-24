module Searches
  class Initiatives
    attr_accessor :initiatives

    def initialize(conditions = nil, page = 1)
      @initiatives ||= find_initiatives conditions, page
    end

    def find_initiatives(conditions, current_page)
      @initiative_search = Initiative
      if conditions
        find_by_representative_id conditions[:representative_id] if conditions[:representative_id]
      end
      @initiative_search.page(current_page)
    end

    private

    def find_by_representative_id representative_id
      @initiative_search = @initiative_search.joins(:representative).where(representative_id: representative_id) if representative_name
    end
  end
end