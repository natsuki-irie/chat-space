json.name @message.user.name
json.created_at  @message.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.id @message.id
json.text @message.text
json.image image_tag @message.image