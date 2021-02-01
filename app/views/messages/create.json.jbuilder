json.user_name @message.user.name
json.user_image url_for(@message.user.image)
json.text @message.text
json.created_at @message.created_at.strftime("%Y/%m/%d %H:%M")
json.image url_for(@message.image.variant(resize: "500x500"))