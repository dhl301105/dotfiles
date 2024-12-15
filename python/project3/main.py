import requests

img_data = requests.get("https://static.cdnno.com/poster/tro-tan-van-minh/300.jpg?1714047427").content
with open('image_name.jpg', 'wb') as handler:
    handler.write(img_data)
