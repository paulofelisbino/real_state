class PropertyDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      reference: { source: "Property.reference" },
      property_type: { source: "PropertyType.name" },
      price: { source: "Property.price", formatter: sanitize_price }
    }
  end

  def data
    decorated_records = PropertyDecorator.decorate_collection(records)
    decorated_records.map do |record|
      {
        reference: record.reference,
        property_type: record.property_type_name,
        price:  record.formatted_price,
        dt_actions: record.dt_actions,
        DT_RowId: record.id, # This will automagically set the id attribute on the corresponding <tr> in the datatable
      }
    end
  end

  def filter_category
    @filter_category ||= options[:filter_category]
  end

  def get_raw_records
    return Property.includes(:property_type).all.references(:property_type) if filter_category.nil?

    Property.validate_filter_category(filter_category)
    Property.includes(:property_type).send(filter_category).references(:property_type)
  end

  def sanitize_price
    ->(value) do
      search = value.tr('R$', '')
      search = search.tr('.', '')
      search = search.tr(',', '.')
      search
    end
  end
end
