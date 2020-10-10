# content_idを初期データとして入れておく
1000.times do |number|
  Content.create(id: "#{number + 1}")
end