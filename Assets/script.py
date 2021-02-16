from PIL import Image

im = Image.open('nuance.jpg')
pixelMap = im.load()
# im.show()

img = Image.new(im.mode, im.size)
pixelsNew = img.load()

print(img.size)

for i in range(img.size[0]):
    for j in range(img.size[1]):
        if i < round(img.size[0]/2 + 1):
            if pixelMap[i, j] == (255, 255, 255):
                pixelsNew[i, j] = (255, 255, 255)
            #     print('here')
            else:
                pixelsNew[i, j] = (255, 0, 0)
        # print(pixelMap[i, j])
        else:
            if pixelMap[i, j] == (255, 255, 255):
                pixelsNew[i, j] = (255, 255, 255)
            else:
                pixelsNew[i, j] = (0, 0, 255)

# img.show()
img.save('lack-of-nuance.jpg')
