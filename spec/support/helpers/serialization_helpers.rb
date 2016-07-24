module SerializationHelpers

  def serialize_collection(collection, options={})
    ActiveModel::Serializer::CollectionSerializer.new(collection, options).as_json
  end
end
