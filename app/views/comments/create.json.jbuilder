json.comment @comment.comment
json.image @comment.image_url
json.user_name @comment.user.name
json.id @comment.id
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")