import os
import random


trainPath = 'D:\\sun\\Resnet152\\train\\' 
valPath = 'D:\\sun\\Resnet152\\val\\' 

train = {}
val = {}

    
# add
for name in os.listdir(trainPath + "papertowel\\"):
    train[name] = 0
     
# add 
for name in os.listdir(trainPath + "tabbycat\\"):
    train[name] = 1
    
# add 
for name in os.listdir(trainPath + "parachute\\"):
    train[name] = 2


# add
for name in os.listdir(valPath + "papertowel\\"):
    val[name] = 0
     
# add
for name in os.listdir(valPath + "tabbycat\\"):
    val[name] = 1
    

# add
for name in os.listdir(valPath + "parachute\\"):
    val[name] = 2
    
    
ftrain = open("D:\\sun\\Resnet152\\train\\train.txt", 'w')
fval = open("D:\\sun\\Resnet152\\val\\val.txt", 'w')

trainName = []
valName = []
for (item) in train:
    trainName.append(item)

for item in val:
    valName.append(item)

random.shuffle(trainName)
random.shuffle(valName)

for name in trainName:
    label = train[name]
    ftrain.write(name + " " + str(label) + "\n")

for name in valName:
    label = val[name]
    fval.write(name + " " + str(label) + "\n")

ftrain.close() 
fval.close()