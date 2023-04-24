json.array! @trainers do |trainer|
    json.partial! 'trainer', trainer: trainer
end