json.user_name @message.user.name

if @message.user.image.attached?
  json.user_image url_for(@message.user.image)
end
  
json.text @message.text
json.created_at @message.created_at.strftime("%Y/%m/%d %H:%M")

if @message.image.attached?
  json.image url_for(@message.image.variant(resize: "500x500"))
end
  