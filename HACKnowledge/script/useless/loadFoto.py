import cv2 as cv
import face_recognition

path = "/home/salvatore/Scrivania/developement/ideas/clemente/foto/"

target_image1 = face_recognition.load_image_file(path+"selene.jpg")
target_encoding1 = face_recognition.face_encodings(target_image1)[0]

if target_encoding1[0]:
	print("la foto viene caricata correttamente\n")
	img = cv.imread(path+"selene.jpg")
	cv.imshow("IMMAGINE",img)
	cv.waitKey(20000)
	
